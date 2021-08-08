And(/^I tap on the "(.*?)" stream button$/) do |button|
  case button
  when 'schedules'
    on(StreamScreen).tap_schedules_btn
  when 'standings'
    on(StreamScreen).tap_standings_btn
  end
end

# This is an Applitools Test
And(/^live updates module is shown$/) do
  MobileDriver.snap_eyes('Verify Live Update Module Screen')
end

And(/^I remove "(.*?)" from My Players$/) do |name|
  on(GlobalScreenElements).tap_textview('My Players')
  on(GlobalScreenElements).tap_textview(name)
end

Then(/^I verify that Video Play button displayed$/) do
  ReusableFunction.scroll_up until on(VideoScreen).verify_br_video_module
  ReusableFunction.scroll_up
  on(VideoScreen).verify_vid_play_btn_exists
end

#FIXME: Block has too many lines
When(/^I scroll to a Twitter Post "(.*?)"$/) do |option|
  case option
  when 'without a Title'
    count = 15
    until exists { find_element(:xpath, "//android.widget.TextView[@text='B/R Kicks']") } || count.zero?
      ReusableFunction.scroll_up
      count -= 1
    end
  when 'with a Picture'
    count = 15
    until exists { find_element(:xpath, "//android.widget.TextView[@text='B/R Kicks']") } || count.zero?
      ReusableFunction.scroll_up
      count -= 1
    end
    ReusableFunction.scroll_up
  when 'with a Title'
    count = 3
    until exists { find_element(:xpath, "//android.widget.TextView[@text='Test Tall Video']") } || count.zero?
      ReusableFunction.scroll_up
      count -= 1
    end
  when 'with a Video'
    count = 3
    until exists { find_element(:xpath, "//android.widget.TextView[@text='Test Tall Video']") } || count.zero?
      ReusableFunction.scroll_up
      count -= 1
    end
    ReusableFunction.scroll_up
  end
  ReusableFunction.scroll_up
end

Then(/^I verify My Fantasy Team stream contains stories,tweets about "(.*?)"$/) do |text|
  unless exists { find_element(:xpath, "//android.widget.TextView[contains(@text,'#{text}')]") }
    raise('No tweets or stories about my players')
  end
end

Then(/^I tap on Community textview$/) do
  find_element(:xpath, "//android.widget.LinearLayout[@content-desc='Community  ']/android.widget.TextView").click
end