# Email Step Definition
Given(/^I decide to sign in with "(.*?)"$/) do |status|
  # Enables dodgeball streams via search
  LaunchLinks.launch_dodgeball_stream

  step 'the "Join The Team" social promo is "shown"'
  on(WelcomeScreen).tap_sign_in_btn

  case status
  when 'email'
    on(SignInScreen).tap_signin_email_phone_btn
    on(SignInScreen).tap_sign_in_email_btn
  when 'phone'
    on(SignInScreen).tap_signin_email_phone_btn
  when 'facebook'
    on(SignInScreen).tap_sign_in_fb_btn
  when 'gmail'
    on(SignInScreen).tap_sign_in_google_btn
  end
end

When(/^I provide a "(.*?)" email$/) do |status|
  case status
  when 'valid'
    on(SignInScreen).set_email_txtfield(TestData.use_data('credentials', 'verified_email'))
  when 'invalid'
    on(SignInScreen).set_email_txtfield(TestData.use_data('credentials', 'invalid_email'))
  when 'invalid format'
    on(SignInScreen).set_email_txtfield(TestData.use_data('credentials', 'invalid_email_format'))
  when 'NoFollowers'
    on(SignInScreen).set_email_txtfield(TestData.use_data('credentials', 'nofollowers_email'))
  when 'OneFollower'
    on(SignInScreen).set_email_txtfield(TestData.use_data('credentials', 'onefollower_email'))
  when 'MultipleFollowers'
    on(SignInScreen).set_email_txtfield(TestData.use_data('credentials', 'multforllowers_email'))
  when 'noDM'
    on(SignInScreen).set_email_txtfield(TestData.use_data('credentials', 'no_dms_email'))
  when 'DMReceiver'
    on(SignInScreen).set_email_txtfield(TestData.use_data('credentials', 'dmreceiver_email'))
  when 'stream_add'
    on(SignInScreen).set_email_txtfield(TestData.use_data('credentials', 'stream_add_email'))
  when 'valid facebook'
    on(SignInScreen).set_fb_email_txtfield(TestData.use_data('credentials', 'valid_fb_email'))
  else
    on(SignInScreen).set_email_txtfield(status)
  end
end

When(/^I provide a dynamic "(.*?)" and "(.*?)"$/) do |email, pwd|
  on(SignInScreen).set_email_txtfield(email)
  on(SignInScreen).set_pwd_txtfield(pwd)
  ReusableFunction.wait_for(3)
end

And(/^I provide a "(.*?)" password$/) do |status|
  case status
  when 'valid'
    on(SignInScreen).set_pwd_txtfield(TestData.use_data('credentials', 'verified_password'))
  when 'invalid'
    on(SignInScreen).set_pwd_txtfield(TestData.use_data('credentials', 'invalid_password'))
  when 'NoFollowers', 'OneFollower', 'MultipleFollowers'
    on(SignInScreen).set_pwd_txtfield(TestData.use_data('credentials', 'followers_test_password'))
  when 'noDM'
    on(SignInScreen).set_pwd_txtfield(TestData.use_data('credentials', 'no_dms_password'))
  when 'stream_add'
    on(SignInScreen).set_pwd_txtfield(TestData.use_data('credentials', 'stream_add_password'))
  when 'valid facebook'
    on(SignInScreen).set_fb_pw_txtfield(TestData.use_data('credentials', 'valid_fb_pw'))
  end

  ReusableFunction.hide_keyboard_option
end

And(/^I tap on the facebook login button$/) do
  on(SignInScreen).tap_fb_login_btn
end

And(/^I tap on the facebook continue button$/) do
  on(SignInScreen).tap_fb_continue_btn
end

# PHONE NUMBER Step Definition
When(/^I provide a "(.*?)" phone "(.*?)"$/) do |status, number|
  case status
  when 'valid', 'invalid'
    ReusableFunction.hide_keyboard_option
    on(SignInScreen).set_phone_txtfield(number)
    ReusableFunction.wait_for(4)
  end
end

# FORGOT PASSWORD Step Definition
Given(/^I forgot my password$/) do
  navigate_all(using: :nav_forgot_pw)
end

Then(/^User should get "(.*?)" toast message displayed$/) do |toast_msg|
  unless toast_msg.eql?(on(GlobalScreenElements).get_toast_msg)
    raise('Toast message is not displayed.')
  end
end

Given(/^I sign in to use the app$/) do
  # Enables dodgeball streams via search
  LaunchLinks.launch_dodgeball_stream

  # Sign In Steps
  step 'the "Join The Team" social promo is "shown"'
  on(WelcomeScreen).tap_sign_in_btn
  on(SignInScreen).sign_in_with_email
  ReusableFunction.hide_keyboard_option
  on(GlobalScreenElements).tap_continue_btn
  sleep 5
  on(DashboardScreen).tap_home_btn
  sleep 3
end

Given(/^I do not sign in to use the app$/) do
  search = TestData.use_data('search_options', 'media')

  on(WelcomeScreen).tap_pick_teams_btn
  on(ChooseYourTeamScreen).set_search_txtfield(search)
  text(search).click
  on(GlobalScreenElements).tap_done_btn
end

And(/^I tap on the Log in with Email button$/) do
  on(SignInScreen).tap_sign_in_email_btn
end

# This is an Applitools Test
Then(/^the user is redirected to the google login screen$/) do
  sleep 30
  MobileDriver.snap_eyes('Verify Google Login Screen')
end

Then(/^I launch the gamecast track$/) do
  execute_script('mobile: deepLink', { 'url' => 'teamstream://gamecast/boston-celtics-vs-toronto-raptors-2020-9-1-16-30',
                                       'package' => 'com.bleacherreport.android.teamstream' })
  sleep 5
end