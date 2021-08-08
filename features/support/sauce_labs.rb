require 'rest_client'

class Sauce

  def self.set_job_status(job_id, success)
    rest_jobs_url = "https://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@saucelabs.com/rest/v1/#{ENV['SAUCE_USERNAME']}/jobs"
    RestClient.put "#{rest_jobs_url}/#{job_id}", {"passed" => success, "build" => ENV['APP_VER']}.to_json, :content_type => :json
  end

  def self.set_feature_name(scenario)
    feature = scenario.feature.name
    scenario = scenario.name
    ENV['TEST_NAME'] = "#{feature} - #{scenario} - #{ENV['TAG']}"
  end

end