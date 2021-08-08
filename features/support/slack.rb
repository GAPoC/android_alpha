require 'slackr'


class Slack

  def initialize
    @slack = Slackr.connect('bleacherreport', 'JASn9M0OMhdlIpY3sVzCFZBc', {'channel' => '#android-automation-alpha', "username" => 'saucelabs-uploader'})
  end

  def say(msg, room = {})
    @slack.say(msg, room)
  end

end