And(/^I sign in through settings for "(.*?)" locales$/) do |locale|
  on(SettingsScreen).tap_settings_sign_in_btn

  case locale
  when 'US'
    on(SignInScreen).sign_in_with_email
  when 'non-US'
    on(SignInScreen).sign_in_with_email_non_us
  end

  ReusableFunction.hide_keyboard_option
  on(GlobalScreenElements).tap_continue_btn
  sleep 10
  on(SignInScreen).tap_connect_friends_skip_btn
end

And(/^I tap on the "(.*?)" option in settings$/) do |button|
  case button
  when 'My Profile'
    on(SettingsScreen).tap_my_profile_btn
  when 'Sign In'
    on(SettingsScreen).tap_settings_sign_in_btn
  when 'Create Account'
    on(SettingsScreen).tap_settings_create_account_btn
  end
end

And(/^I tap on the video autoplay setting$/) do
  ReusableFunction.wait_for(3)
  on(SettingsScreen).tap_video_autoplay_btn
end

And(/^I choose "(.*?)" from alert settings$/) do |setting|
  case setting
  when 'my teams'
    on(SettingsScreen).tap_my_teams_only_btn
  when 'top news'
    on(SettingsScreen).tap_top_news_my_teams_btn
  when 'OK', 'YES'
    on(SettingsScreen).tap_settings_ok_btn
  end
end

And(/^I choose "(.*?)" only from video autoplay settings$/) do |setting|
  case setting
  when 'wifi only', 'cellular'
    on(SettingsScreen).tap_wifi_cellular_btn
  when 'never'
    on(SettingsScreen).tap_never_autoplay_btn
  when 'OK'
    on(SettingsScreen).tap_settings_ok_btn
  end
end

And(/^the mobile app version is shown$/) do
  ReusableFunction.scroll_up
  on(SettingsScreen).verify_app_build_version_txt
  puts on(SettingsScreen).get_app_build_version_txt
end

Then(/^the setting should be set to "(.*?)"$/) do |options|
  sleep 3
  on(GlobalScreenElements).verify_textview_exist(options)
end

Then(/^I sign out to clear the device$/) do
  global_elem = GlobalScreenElements.new

  if global_elem.verify_toolbar_title_exist? && global_elem.get_toolbar_title == 'Settings'
    puts 'Sign Out Flow Initiated'
  else
    on(DashboardScreen).tap_home_btn
    on(Experiments).skip_headline_popup_flow
    on(DashboardScreen).tap_settings_btn('More Options')
    step 'the "Find Out Who You Know on B/R" social promo is "shown"'
  end
  on(SettingsScreen).sign_out_flow
end

And(/^I navigate to notification details$/) do
  find_element(:id, 'com.bleacherreport.android.teamstream:id/img_next_button').click
end

# This is an Applitools Test
Then(/^I can "(.*?)" the scores and spoilers$/) do |toggle|
  find_element(:xpath, "//android.widget.TextView[@text='Scores & Spoilers']").click

  case toggle
  when 'enable'
    MobileDriver.snap_eyes('Verify Scores and Spoilers Enabled Screen')
  when 'disable'
    MobileDriver.snap_eyes('Verify Scores and Spoilers Disabled Screen')
  end
end

Then(/^I verify that Top news headlines are not displayed$/) do
  begin
    counter = 0
    while counter < 5
      if on(GlobalScreenElements).verify_top_news_headline
        Appium::TouchAction.new.swipe(start_x: 507,
                                      start_y: 269,
                                      end_x: 499,
                                      end_y: 1574).perform
        break
      end
      counter += 1
    end
  rescue StandardError
    step 'I tap on "New Stories" textview'
    if on(GlobalScreenElements).verify_top_news_headline
      raise('Top News Headline Persist')
    end
  end
end