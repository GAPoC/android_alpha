And(/^I scroll to related videos$/) do
  counter = 20
  until exists { find_element(:id, 'com.bleacherreport.android.teamstream:id/carousel') } || counter.zero?
    Appium::TouchAction.new.swipe(start_x: 500,
                                  start_y: 1200,
                                  end_x: 500,
                                  end_y: 400,
                                  duration: 800).perform
    counter -= 1
    sleep 1
  end
end

And(/^I tap on See All Videos textview$/) do
  2.times do
    Appium::TouchAction.new.swipe(start_x: 500,
                                  start_y: 1200,
                                  end_x: 500,
                                  end_y: 400,
                                  duration: 800).perform
  end

  on(VideoScreen).tap_see_all_videos
end

And(/^I tap on the "(.*?)" play video$/) do |status|
  ReusableFunction.scroll_up until on(VideoScreen).verify_br_video_module
  ReusableFunction.scroll_up

  case status
  when 'auto'
    on(VideoScreen).tap_br_video_module
  when 'manual'
    on(VideoScreen).tap_play_btn
  end
end