require 'json'
require 'report_builder'
require_relative 'slack'

module Reporting

  #Creates necessary folders for reporting
  def create_results_folder
    root_dir = File.expand_path('')
    results_dir = root_dir + '/results/'
    ss_dir = root_dir + '/results/screenshots/'
    ei_dir = root_dir + '/results/screenshots/actualImages/'
    Dir.mkdir(results_dir) unless Dir.exists?(results_dir)
    Dir.mkdir(ss_dir) unless Dir.exists?(ss_dir)
    Dir.mkdir(ei_dir) unless Dir.exists?(ei_dir)
    FileUtils.chmod_R(0777, results_dir)
    FileUtils.chmod_R(0777, ss_dir)
    FileUtils.chmod_R(0777, ei_dir)
    puts 'Done with the creation of Results folder...'
  end

  #Starts the cucumber-sandwich.jar executable
  def start_cucumber_sandwich_report_server

    project_dir = File.expand_path('')
    server_dir = project_dir + '/lib/cucumber-sandwich/cucumber-sandwich.jar'
    report_dir = project_dir + '/results'

    #Spawns the cucumber json output to generate html results
    pid = spawn("java -jar #{server_dir} -f #{project_dir} -o #{report_dir}", :out => 'results/test.out', :err => 'results/test.err')
    Process.detach(pid)
    puts "Cucumber Sandwich Session PID: #{pid}"
  end

  #stops cucumber-sandwich report server
  def stop_cucumber_sandwich_report_server
    system('killall java')
  end

  def remove_old_cucumber_report
    system('rm -r results')
  end

  def remove_old_cucumber_json
    Dir.glob('*.json').each do |file|
      File.delete(file)
    end
  end

  def remove_xray_jsons
    File.delete("test_exec_info.json")
    File.delete("my_test_report.json")
  end

  def remove_old_html_report
    Dir.glob('*.html').each do |file|
      File.delete(file)
    end
  end

  def rm_old_cucumber_json_report
    remove_old_cucumber_report
    remove_old_cucumber_json
    remove_old_html_report
  end

  #Zips reports for easy sharing and optimization
  def zip_reports
    # begin
    base_dir = Dir.pwd
    directory = base_dir + '/results'
    zipfile_name = base_dir + "/results/cucumber-html-reports_Time-#{Time.now.strftime("%d_%m_%y_%H_%M_%S")}.zip"
    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      Dir[File.join(directory, '**', '**')].each do |file|
        zipfile.add(file.sub(directory, ''), file)
      end
    end
    rescue
      false
  end

  def take_screenshot
    date_stamp = Time.now.strftime('%m_%d_%y_%H_%M_%S')
    screenshot_name = date_stamp + '.png'
    screenshot_file = File.join('results/screenshots/actualImages', screenshot_name)
    $driver.screenshot(screenshot_file)
    base64_img = Base64.encode64(File.open(screenshot_file, 'r:UTF-8', &:read))
    embed(base64_img, 'image/png;base64')
  end

  def build_report
    puts 'Building Report'

    jsons = []
    Dir.glob('*cucumber*.json') do |f|
      file_ = File.read(f)
      unless file_.empty?
        path = File.expand_path(File.dirname(File.dirname(f)))
        jsons.push(f)
      end
    end

    ReportBuilder.configure do |config|
      config.input_path = jsons
      config.report_path = 'my_test_report'
      config.report_types = [:retry, :html, :json]
      config.report_title = 'Sample Test Results'
    end

    ReportBuilder.build_report

  end

  def get_run_stats_standard(reports)
    @stats = { passed: 0, failed: 0, skipped: 0, undefined: 0 }

    reports.each do |fname|
      file = File.read(fname)
      scenarios_line = file.lines.last.split('innerHTML = "').last.split('<br />').first
      @stats.keys.each do |state|
        if scenarios_line.include? state.to_s
          @stats[state] += scenarios_line[/(\d+) #{state.to_s}/, 1].to_i
        end
      end
    end

    return @stats
  end

  def xray_token
    uri = URI.parse('https://xray.cloud.xpand-it.com/api/v1/authenticate')
    request = Net::HTTP::Post.new(uri)
    request.content_type = 'application/json'
    request.body = JSON.dump({
                                 'client_id' => '02A12C0761CA49C691B7812F82AAE07E',
                                 'client_secret' => '97ed08d14f41be572dc0ee5f9c117ea2f59cf3590351b659193431b0bccd5e43' })

    req_options = {
        use_ssl: uri.scheme == 'https',
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    str = response.body.to_s
    str.gsub! /"/, ''
    return str
  end

  def xray_import_test(token)
    puts 'Importing test results'

    test_exec_info = {
        "fields": {
            "project": {
                "id": '10902'
            },
            "customfield_12325": {
                "id": '10620'
            },
            "summary": 'Smoke test execution',
            "description": 'Execution results for a Smoke test run',
            "labels": [
                'Automation',
                'Smoke'
            ],
            "issuetype": {
                "id": '10503'
            }
        },
        "xrayFields": {
            "testPlanKey": 'QA-4479'
        }
    }

    File.open('test_exec_info.json', 'w') do |f|
      f.write(JSON.pretty_generate(test_exec_info))
    end

    uri = URI.parse('https://xray.cloud.xpand-it.com/api/v1/import/execution/cucumber/multipart')
    request = Net::HTTP::Post.new(uri)
    request['Authorization'] = "Bearer #{token}"

    form_data = [
        ['results', File.read('my_test_report.json'), { filename: 'my_test_report.json' }],
        ['info', File.read('test_exec_info.json'), { filename: 'test_exec_info.json' }]
    ]

    request.set_form form_data, 'multipart/form-data'

    req_options = {
        use_ssl: uri.scheme == 'https',
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    puts "Response code; #{response.code} - #{response.body}"
    body = response.body
    @exec_key_ = JSON.parse(body)
  end

  def print_results_to_slack(testrun_results, rerun_results)
    exec_key = @exec_key_['key']
    @slack = Slack.new

    # test run results
    t_passed = testrun_results[:passed]
    t_failed = testrun_results[:failed]
    t_skipped = testrun_results[:skipped]
    t_total_val = t_passed + t_failed + t_skipped

    msg = "*Parallel run stats for #{t_total_val} scenarios:* :white_check_mark: #{t_passed} scenario passed :x: #{t_failed} scenario failed :warning: #{t_skipped} scenario skipped"

    # rerun results
    if rerun_results.empty?
      msg += "\n*No Reruns*"
    else
      r_passed = rerun_results[:passed]
      r_failed = rerun_results[:failed]
      r_skipped = rerun_results[:skipped]
      r_total_val = r_passed + r_failed + r_skipped
      msg += "\nParallel re-run stats for #{r_total_val} scenarios:* :white_check_mark: #{r_passed} scenario passed :x: #{r_failed} scenario failed :warning: #{r_skipped} scenario skipped"
    end

    msg += "\n*Test Execution:* https://statmilk.atlassian.net/browse/#{exec_key}"

    @slack.say(msg, {'channel' => '#android-automation-alpha', 'username' => 'saucelabs-uploader'})
  end

  end
