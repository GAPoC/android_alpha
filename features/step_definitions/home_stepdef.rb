And(/^the home feed screen is displayed$/) do
  begin
    on(GlobalScreenElements).verify_btn_exist('Post')
    MobileDriver.snap_eyes('Verify Home - Signed In')
    puts 'Signed In'
  rescue
    MobileDriver.snap_eyes('Verify Home - Signed Out')
  end
end

Then(/^Top news headlines are displayed$/) do
  2.times{Appium::TouchAction.new.swipe(start_x: 619, start_y: 356, end_x: 640, end_y: 1523).perform}
  raise("Unable to locate Top News Headline") unless on(GlobalScreenElements).verify_top_news_headline
end

Then(/^the text MORE NEWS is displayed$/) do
  find_element(:id,"com.bleacherreport.android.teamstream:id/additional_headlines_top_news_header").displayed
end

And(/^I tap on See All label$/) do
  find_element(:xpath,"android.widget.TextView[@text='See All']").click
end

Then(/^Top News team name is displayed$/) do
  find_element(:id,"com.bleacherreport.android.teamstream:id/team_name").displayed
end

Then(/^I tap on fire from the top headline$/) do
  find_element(:id,"com.bleacherreport.android.teamstream:id/btn_fire").click
end

Then(/^I tap on the comment from the top headline$/) do
  find_element(:id,"com.bleacherreport.android.teamstream:id/btn_conversation").click
end

Then(/^verify that Top news headlines are not displayed$/) do
  raise("Unable to locate Top News Headline") unless on(GlobalScreenElements).verify_top_news_headline == false
end

Then(/^I scroll till top headlines$/) do
  count = 3
  until on(GlobalScreenElements).verify_top_news_headline or count == 0
    step 'I scroll down "1" time'
  end
  step 'I scroll down "1" time'
end

Then(/^I tap on More options$/) do
  find_element(:xpath,"//android.widget.ImageView[@content-desc='More options']").click
end

And(/^I tap on more headlines in the top headlines$/) do
  find_element(:id,"com.bleacherreport.android.teamstream:id/headlines_additional_track").click
end

And(/^I tap on Fire from the standalone track$/) do
  ReusableFunction.scroll_up unless on(ArticleScreen).verify_reaction_btn_exist
  sleep 10
  #Due to multiple instance of "fire" element.Object Repository value is not used
  fire_btns = find_elements(:id, 'com.bleacherreport.android.teamstream:id/btn_fire')
  fire_btns[1].click
end

Then(/^I tap on comment button on the top news$/) do
  begin
    on(ArticleScreen).verify_conversation_btn
  rescue
      Appium::TouchAction.new.swipe(start_x: 500, start_y: 1200, end_x: 500, end_y: 400, duration: 800).perform
      on(ArticleScreen).verify_conversation_btn
  else
      Appium::TouchAction.new.swipe(start_x: 500, start_y: 1200, end_x: 500, end_y: 400, duration: 800).perform
      raise "Conversation button not found" unless on(ArticleScreen).verify_conversation_btn
  end
  on(ArticleScreen).tap_conversation_btn
end

Then(/^I react on a comment fire$/) do
  # used this from object repro elements are not recognised on(CommentaryFmGamecast).tap_fire_comment_btn
  find_element(:id,"com.bleacherreport.android.teamstream:id/fire_button").click
  @driver.hide_keyboard
end

Then(/^I unreact on a comment fire$/) do
  find_element(:id,"com.bleacherreport.android.teamstream:id/fire_button").click
end


Then(/^I hide the keyboard$/) do
  @driver.hide_keyboard
end
