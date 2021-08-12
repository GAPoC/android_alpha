require 'selenium-webdriver'
require 'eyes_appium'
require 'rubygems'
require 'test_object_test_result_watcher'
require 'date'

class MobileDriver

  def initialize
    set_capabilities
    driver.start_driver
  end

  def print_all_capabilities(desired_capabilities)
    puts 'Application Capabilities:'
    desired_capabilities.each { |k, v| puts "#{k}:#{v}" + "\n" }
  end

  def print_specific_caps
    puts 'Capabilities:'
    puts "Platform => #{ENV['PLATFORM_NAME']} , Device => #{ENV['DEVICE_NAME']} , Version => #{ENV['PLATFORM_VERSION']} App_Build => #{ENV['APP_VER']}"
  end

  def set_capabilities
    @AppPath = ENV['APP_PATH']
    file_path = File.expand_path('') + "/features/support/appium.txt"

    @desired_capabilities = {
      caps: {
        'platformName' => ENV['PLATFORM_NAME'],
        'deviceName' => ENV['DEVICE_NAME'],
        'deviceOrientation' => ENV['DEVICE_ORIENTATION'],
        'platformVersion' => ENV['PLATFORM_VERSION'],
        'app' => ENV['APP_PATH'],
        'browserName' => ENV['BROWSER_NAME'],
        'public' => "share",
        'testobject_api_key' => ENV['TESTOBJECT_API_KEY'],
        'testobject_suite_name' => ENV['TESTOBJECT_SUITE_NAME'],
        'testobject_test_name' => ENV['TESTOBJECT_TEST_NAME'],
        'phoneOnly' => ENV['PHONE_ONLY'],
        'tabletOnly' => ENV['TABLET_ONLY'],
        'privateDevicesOnly' => ENV['PRIVATE_DEVICE_ONLY'],
        'testobject_app_id' => ENV['TESTOBJECT_APP_ID'],
        'testobject_test_live_view_url' => ENV['TESTOBJECT_LIVE_VIEW_URL'],
        'testobject_test_report_url' => ENV['TESTOBJECT_REPORT_URL'],
        'locale' => ENV['LOCALE'],
        'language' => ENV['LANGUAGE'],
        'fullReset' => true,
        'noReset' => false,
        'skipDeviceInitialization' => ENV['SKIP_INITIALIZATION'],
        'appWaitActivity' => ENV['APP_WAIT_ACTIVITY'],
        'appActivity' => ENV['APP_ACTIVITY'],
        'automationName' => 'UiAutomator2',
        'newCommandTimeout' => 300,
        'wdaStartupRetryInterval'=>'500',
        'sauce:options'=> {
            'name' => ENV['TEST_NAME'],
            'appiumVersion' => '1.20.1'
        }
      },
      appium_lib: {
        'sauce_username' => ENV['SAUCE_USERNAME'],
          'sauce_access_key' => ENV['SAUCE_ACCESS_KEY'],
          'server_url' => ENV['SERVER_URL']
      }
    }

    if ENV['CLOUD_EXEC'] == 'Y'
      Appium::Driver.new(@desired_capabilities, true)
      print_specific_caps

    elsif @AppPath.nil?
      Appium::Driver.new(Appium.load_appium_txt file: File.expand_path('') + "/features/support/appium.txt", verbose: true)

    elsif @AppPath.start_with?('storage:')
      Appium::Driver.new(@desired_capabilities, true)
      print_specific_caps

    else
      puts "** App not available in the specified path ** Execution Quits !"
      exit 0
    end
    Appium.promote_appium_methods Object
  end

  def self.set_batch
    @batch_name = ENV['BATCH_NAME']
    @platform_name = ENV['PLATFORM_NAME']
    rc_build = ENV['APP_VER']
    date_stamp = Time.now.strftime("%m_%d_%y")

    if @batch_name.nil?
      puts 'Batch Name Empty. No UI Test Captured'
    else
      @b = Applitools::BatchInfo.new("#{@batch_name.capitalize}: #{@platform_name.capitalize} #{date_stamp}_#{rc_build}")
      @b.id = "#{@batch_name}_#{rc_build}"
      @b.sequence_name = "#{@platform_name} #{@batch_name}"
    end
  end

  #Used new eyes_appium
  def self.snap_eyes(test_name)
    eyes = Applitools::Appium::Eyes.new() # Initialize the eyes SDK
    eyes.api_key = '6zRsif2Y4CYchwTK98ItIxaBrtpP109M4W8BVlcvcRCHLY110' #Set your private API key.
    eyes.match_level = 'Strict'

    if !@batch_name.nil?
      begin
        # Start the test.
        ReusableFunction.wait_for(5)
        eyes.batch = @b

        eyes.open(app_name: 'BR Android', test_name: test_name, driver: driver)
        eyes.check("#{test_name}", Applitools::Appium::Target.window)

        # End the test. Add error logging
        eyes.close
      ensure
        # If the test was aborted before eyes.close was called, ends the test as aborted.
        eyes.abort_if_not_closed
      end
    end
  end
end
