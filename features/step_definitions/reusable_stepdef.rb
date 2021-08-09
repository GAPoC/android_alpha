And(/^I tap on the "(.*?)" button$/) do |element|
  case element.downcase
  when 'hide keyboard'
    ReusableFunction.hide_keyboard_option
  when 'maybe later'
    on(SignUpScreen).tap_maybe_later_btn
  when 'add chat'
    on(DMInboxScreen).tap_add_chat_btn
  when 'see more'
    on(StreamScreen).tap_see_more_btn
  when 'done'
    on(GlobalScreenElements).tap_done_btn
    ReusableFunction.wait_for(15)
  when 'action done'
    on(GlobalScreenElements).tap_action_done_btn
  when 'action next'
    on(GlobalScreenElements).tap_action_next_btn
  when 'send code'
    on(GlobalScreenElements).tap_continue_btn
    ReusableFunction.wait_for(10)
  when 'continue'
    on(GlobalScreenElements).tap_continue_btn
  when 'edit profile'
    step 'the "Find Out Who You Know on B/R" social promo is "shown"'
    on(MyBRScreen).tap_mybr_edit_profile_btn
    ReusableFunction.wait_for(10)
  when 'invite'
    ReusableFunction.wait_for(2)

    begin
      btn = find_element(:xpath, "//android.widget.Button[@text='Connect Contacts']")
      ele = find_element(:xpath, "//android.widget.TextView[@text='Connect with your Squad']")

      btn.click if ele.displayed?
    rescue StandardError
      on(FindFriendsScreen).tap_invite_btn
    end
  else
    ReusableFunction.wait_for(10)
    on(GlobalScreenElements).tap_general_button(element)
  end
  step 'the "Find Out Who You Know on B/R" social promo is "shown"'
end

And(/^I verify the "(.*?)" button$/) do |ele|
  on(GlobalScreenElements).verify_btn_exist(ele)
end

Then(/^User should get "(.*?)" text status displayed$/) do |txt_status|
  ReusableFunction.wait_for(3)
  puts on(GlobalScreenElements).get_text_status
  unless txt_status.eql?(on(GlobalScreenElements).get_text_status)
    raise("Element #{txt_status} is not displayed.")
  end
end

Then(/^I choose a "(.*?)" username for my account$/) do |username_status|
  case username_status
  when 'valid', 'new'
    on(GlobalScreenElements).set_username_txtfield(ReusableFunction.generate_username)
  when 'existing'
    on(GlobalScreenElements).set_username_txtfield(TestData.use_data('credentials', 'registered_username'))
    ReusableFunction.wait_for(2)
    hide_keyboard
  end
end

Then(/^I close the keyboard$/) do
  hide_keyboard
end

# This is an Applitools Test
Then(/^I am redirected to the "(.*?)" screen$/) do |screen|
  sleep 5
  if ENV['PLATFORM_VERSION'] == '7.0' && ENV['DEVICE_NAME'] == 'Android GoogleAPI Emulator'
    puts 'Running Android 7.0' # FIXME: Fails selenium connection (500) when running android7.0
  else
    MobileDriver.snap_eyes("Verify #{screen} Screen")
  end
end

Then(/^User should get "(.*?)" text summary displayed$/) do |txt_summary|
  # Returns only last 4 of string - Mainly used for phone number validation
  num_str = txt_summary
  last_four = num_str[-4..-1]

  begin
    # Used for verifying text summary if phone number
    on(GlobalScreenElements).verify_text_summary(last_four)
  rescue StandardError
    # Used for verifying text summary if text content
    on(GlobalScreenElements).verify_text_summary(txt_summary)
  end
end

And(/^I tap on the save button$/) do
  on(GlobalScreenElements).tap_save_btn
end

Then(/^the textview "(.*?)" is displayed$/) do |textview|
  sleep 7
  on(GlobalScreenElements).verify_textview_exist(textview)
end

Then(/^the textview "(.*?)" is not displayed$/) do |textview|
  unless on(GlobalScreenElements).verify_textview_exist_tf(textview) == false; break; end
end

Then(/^the button "(.*?)" is displayed$/) do |button|
  on(GlobalScreenElements).verify_btn_exist(button)
end

And(/^I verify the "(.*?)" button disabled$/) do |bttn|
  on(GlobalScreenElements).verify_btn_disabled(bttn)
end

When(/^I tap on "(.*?)" textview$/) do |textview|
  ReusableFunction.wait_for(7)
  begin
    unless on(GlobalScreenElements).verify_textview_exist(textview)
      ReusableFunction.scroll_up
    end
    on(GlobalScreenElements).tap_textview(textview)
  rescue StandardError
    # Mentions upcase affect Android 7, 8
    if on(GlobalScreenElements).verify_textview_exist(textview.upcase)
      on(GlobalScreenElements).tap_textview(textview.upcase)
    end
  end
  ReusableFunction.wait_for(7)
end

Then(/^I tap on the navigate back button$/) do
  on(GlobalScreenElements).tap_navigate_up_btn
  ReusableFunction.wait_for(5)
end

Then(/^I tap on the Close button$/) do
  on(GlobalScreenElements).tap_close_tab_btn
  ReusableFunction.wait_for(5)
end

And(/^I "(.*?)" the alert permission$/) do |option|
  ReusableFunction.wait_for(3)
  case option
  when 'allow'
    on(GlobalScreenElements).tap_allow_permission
  when 'deny'
    on(GlobalScreenElements).tap_deny_permission
  end
end

Then(/^I scroll to "(.*?)"$/) do |text|
  begin
    ReusableFunction.scroll_to(text)
  rescue StandardError
    3.times { ReusableFunction.scroll_up }
  end
end
And(/^I tap into the "(.*?)" textfield$/) do |textfield|
  case textfield
  when 'comment'
    begin
      on(CommentScreen).tap_comment_txtfield
    rescue StandardError
      ReusableFunction.scroll_up
      on(CommentScreen).tap_comment_txtfield
    end
  end
end

And(/^I navigate back using device back button$/) do
  back
  sleep 5
end

# Taps on Checked Textview - PopUp Alert text1 Element
And(/^I tap on "(.*?)" from checked textview$/) do |txt|
  find_element(:xpath, "//android.widget.CheckedTextView[@text='#{txt}']").click
end

# This is an Applitools Test
Then(/^the "(.*?)" screen is displayed$/) do |screen_name|
  ReusableFunction.wait_for(7)
  if on(GlobalScreenElements).verify_toolbar_title_exist? && on(GlobalScreenElements).get_toolbar_title == 'Notifications'
    MobileDriver.snap_eyes('Verify Notification Screen')
    on(GlobalScreenElements).tap_done_btn
  end
  MobileDriver.snap_eyes("Verify #{screen_name} Screen")
end

# This is an Applitools Test
Then(/^the "(.*?)" scores screen is displayed$/) do |sport|
  if on(ScoresScreen).verify_scores_no_game
    MobileDriver.snap_eyes("Verify No Games - #{sport} Today Screen")
  else
    begin
      if !on(ScoresScreen).verify_seeall_standing_link_exist
        MobileDriver.snap_eyes("Verify #{sport} Scores Screen")
      elsif on(ScoresScreen).get_seeall_standing_link_txt == 'See All'
        MobileDriver.snap_eyes("Verify #{sport} with SEE ALL Scores Screen")
      elsif on(ScoresScreen).get_seeall_standing_link_txt == 'Standings'
        MobileDriver.snap_eyes("Verify #{sport} with STANDINGS Scores Screen")
      else
        MobileDriver.snap_eyes("Verify #{sport} with STANDINGS Scores Screen")
      end
    rescue StandardError
      puts 'No games yet'
    end
  end
end

And(/^I pull to refresh the stream$/) do
  sleep 3
  Appium::TouchAction.new.swipe(start_x: 619,
                                start_y: 356,
                                end_x: 640,
                                end_y: 1523).perform
end

Then(/^I print the page source$/) do
  # for debug purpose
  puts get_source
end

Then(/^I scroll down "(.*?)" time$/) do |x|
  x.to_i.times {
    Appium::TouchAction.new.swipe(start_x: 500,
                                  start_y: 1400,
                                  end_x: 500,
                                  end_y: 400,
                                  duration: 600).perform }
end

And(/^I tap on a GIF image$/) do
  # This locator uses a class element finder
  gifs = find_elements(:id, 'com.bleacherreport.android.teamstream:id/gif_image')
  gifs[1].click
end

And(/^I add dodgeball team from my br$/) do
  step 'I tap on the "my br" icon tab'
  step 'I tap on the add button from my teams'
  step 'I am redirected to choose my team'
  sleep 10
  step 'the "*New* Video Posts 📽" social promo is "shown"'
end