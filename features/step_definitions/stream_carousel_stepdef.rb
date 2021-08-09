Then(/^I scroll till stream carousel$/) do
  begin
    find_element(:id, 'com.bleacherreport.android.teamstream:id/stream_team_carousel_container').displayed?
  rescue StandardError
    2.times do
      Appium::TouchAction.new.swipe(start_x: 500,
                                    start_y: 1200,
                                    end_x: 500,
                                    end_y: 400,
                                    duration: 800).perform
    end
  end
end

Then(/^stream carousel is displayed$/) do
  find_element(:id, 'com.bleacherreport.android.teamstream:id/team_carousel').displayed?
end

Then(/^stream recommendation carousel is displayed$/) do
  step 'I scroll down "1" time'
  ReusableFunction.scroll_down until on(StreamScreen).verify_recommendation_heading_txt_exists
end

Then(/^I swipe to see all recommended teams in the carousel and add teams$/) do
  step 'stream recommendation carousel is displayed'
  # FIXME: Avoid using static integer for loop placements
  9.times do
    step 'I tap on the "Add" button'
    sleep 1
  end
end

Then(/^I scroll till stream carousel tool tip in home tab$/) do
  step 'I scroll to "See All"'
  step 'I scroll down "1" time'
  until find_element(:id, 'com.bleacherreport.android.teamstream:id/tooltip')
    ReusableFunction.scroll_down
  end
end

And(/^I verify the "(.*?)" button on the stream carousel$/) do |button|
  case button
  when 'See All'
    10.times do
      Appium::TouchAction.new.swipe(start_x: 998,
                                    start_y: 1132,
                                    end_x: 91,
                                    end_y: 1128,
                                    duration: 800).perform
    end

    find_element(:id, 'com.bleacherreport.android.teamstream:id/option_title').displayed?
  when 'Add Teams'
    2.times do
      Appium::TouchAction.new.swipe(start_x: 998,
                                    start_y: 1132,
                                    end_x: 91,
                                    end_y: 1128,
                                    duration: 800).perform
    end

    step 'I tap on "Add Teams" textview'
  end
end
