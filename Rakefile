require 'rubygems'
require 'bundler'
require 'cucumber'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'yard'
require 'zip'
require File.expand_path('') + '/features/support/reporting.rb'

include Reporting

#Describes the rakefile test run feature
desc "Run features with profiles defined"

#Tasks uses cucumber.yml feature to run test

task :default => [:regression] #Default test run for task: default

desc "Runs Specific Profile"
task :run, [:profile] do |t,args|

  profile = args[:profile]

  if Dir.exist? (File.expand_path('') + '/results')
    rm_old_cucumber_json_report # Method to delete cucumber report folder..
  end

  create_results_folder

  #If cucumber.yml profile is nil, default profile will run
  if profile.nil?
    Cucumber::Rake::Task.new(:run) do |t|
      raise 'Profile not provided, Please provide a profile from the cucumber.yml file'
    end
  else
    #Tasks run based on the cucumber.yml profile provided
    Cucumber::Rake::Task.new(:run) do |t|
      # t.cucumber_opts = "#{@tag} --tags ~@not_ready -x --format pretty -f json -o cucumber.json -f rerun --out rerun.txt"
      t.profile = profile
    end
  end
end

desc "Run Regression - Parallel Test"
task :single_parallel, [:device, :tag, :process] do |t, args|

  device = args[:device]
  process = args[:process]
  tag = args[:tag]

  if Dir.exist? (File.expand_path('') + '/results')
    rm_old_cucumber_json_report # Method to delete cucumber report folder..
  end

  create_results_folder

  #Tasks runs parallel testing. Profile, process, and tag provided by user
  Cucumber::Rake::Task.new(:test) do |t|
    system("parallel_cucumber -n #{process} features/ --test-options='-p #{device} -p parallel -t #{tag}'")
  end
end

task :create_report do

  if Dir.exist? (File.expand_path('') + '/results')
    rm_old_cucumber_json_report # Method to delete cucumber report folder..
    create_results_folder
  else
    create_results_folder
  end
  File.delete("cucumber_failures.log") if File.exist?("cucumber_failures.log")
end

task :rerun do
  if File.size("cucumber_failures.log") == 0
    puts "==== No failures. Everything Passed ========="
    @rerun_results = {}
  else
    puts " =========Re-running Failed Scenarios============="
    system("bundle exec cucumber @cucumber_failures.log -p rerun")
    @rerun_results = get_run_stats_standard(Dir.glob('reportRerun.html'))
  end
end

task :reporting do
  @testrun_results = get_run_stats_standard(Dir.glob('*.html'))
  Rake::Task["rerun"].invoke
  build_report
  xray_import_test(xray_token)
  remove_xray_jsons
  print_results_to_slack(@testrun_results, @rerun_results)
end

#**ANDROID SAUCELABS ALLOTTED ONLY 20 VM'S ** --

#**SMOKE - DEVICE RAKEFILE CONFIG** --
task :android_6_0_smoke do
  system("parallel_cucumber -n 1 features/ --test-options='-p smoke6'")
end
task :android_7_0_smoke do
  system("parallel_cucumber -n 1 features/ --test-options='-p smoke7'")
end
task :android_7_0_tablet do
  system("parallel_cucumber -n 1 features/ --test-options='-p smoketablet_7.0'")
end
task :alpha_smoke do
  system("parallel_cucumber -n 15 features/ --test-options='-p alpha'")
end
task :alpha_applitools do
  system("parallel_cucumber -n 15 features/ --test-options='-p alpha_applitools'")
end

#**REGRESSION/APPLITOOLS - DEVICE RAKEFILE CONFIG** --
task :android_10_0 do
  system("parallel_cucumber -n 18 features/ --test-options='-p regression'")
end
task :applitools do
  system("parallel_cucumber -n 18 features/ --test-options='-p applitools'")
end

#**LOCAL APPLITOOLS - DEVICE RAKEFILE CONFIG** --
task :baseline_applitools do
  system("parallel_cucumber -n 1 features/ --test-options='-p baseline'")
end
#**LOCAL APPLITOOLS - DEVICE RAKEFILE CONFIG** --
task :baseline_alpha do
  system("parallel_cucumber -n 1 features/ --test-options='-p baseline_alpha'")
end

#**GEO-LOCALE RAKEFILE CONFIG** --
task :au_locale do
  system("parallel_cucumber -n 1 features/ --test-options='-p au_locale'")
end
task :be_locale do
  system("parallel_cucumber -n 1 features/ --test-options='-p be_locale'")
end
task :uk_locale do
  system("parallel_cucumber -n 1 features/ --test-options='-p uk_locale'")
end
task :uk_locale_alpha do
  system("parallel_cucumber -n 1 features/ --test-options='-p uk_locale_alpha'")
end
task :uk_inprogress do
  system("parallel_cucumber -n 1 features/ --test-options='-p uk_inprogress'")
end
task :be_inprogress do
  system("parallel_cucumber -n 1 features/ --test-options='-p uk_inprogress'")
end
task :au_inprogress do
  system("parallel_cucumber -n 1 features/ --test-options='-p uk_inprogress'")
end
task :be_locale_alpha do
  system("parallel_cucumber -n 1 features/ --test-options='-p be_locale_alpha'")
end

#**TESTOBJECT RAKEFILE CONFIG** --
task :att_testobject1 do
  system("parallel_cucumber -n 1 features/ --test-options=' -p att_testobject1'")
end

#**MAIN RAKEFILE CONFIG** --
# Note that tests tagged @applitools and @regression are both regression tests

desc "Runs ALL device for Regression Test"
# This task is for both UI and Functional Testing
# This task is for RC/Regression Testing

multitask regression:

%i[create_report
   android_10_0
   android_6_0_smoke
   android_7_0_smoke
   android_7_0_tablet
   au_locale
   be_locale
   uk_locale
   applitools]

desc 'Runs Functional Test ONLY on RC'
# This task does not run UI TEST!
multitask functional_test:

%i[create_report
   android_10_0
   android_6_0_smoke
   android_7_0_smoke
   android_7_0_tablet]

desc 'Runs UI Test ONLY on RC'
# This task does not run FUNCTIONAL TEST!
multitask applitools_test:

%i[create_report
   applitools
   au_locale
   be_locale
   uk_locale]

desc 'Runs smoke test for Alpha/Internal Test'
# This task does not run UI TEST!
# This task is only for Internal/Alpha Testing!

multitask alpha:
 %i[create_report
   uk_locale_alpha
   be_locale_alpha
   alpha_smoke] do
  Rake::Task['reporting'].invoke
end