require 'rspec'
require 'appium_lib'
require 'cucumber/core/ast'
require 'require_all'
require 'sauce_whisk'
require 'rubygems'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'yaml'
require 'data_magic'
require 'page_navigation'
require_all 'test_data'
require_all 'features/screens'
require 'net/http'
require 'uri'
require 'json'
require 'test_object_test_result_watcher'
require_all 'screen_factory.rb'
require_all 'features/support/accessors.rb'

require File.expand_path('') + '/features/support/reporting.rb'

include Reporting

World(ScreenModel::ScreenFactory)

Before do |scenario|
  Sauce.set_feature_name(scenario)
  MobileDriver.new
  MobileDriver.set_batch
end

After do |scenario|
  take_screenshot if scenario.failed?
  if ENV['CLOUD_EXEC'] == "N"
    Sauce.set_job_status(session_id, !scenario.failed?)
  end
  puts 'Success: Visual UI Test Complete' unless ENV['BATCH_NAME'].nil?
end

at_exit do
  driver.quit_driver
end