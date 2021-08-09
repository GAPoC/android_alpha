When(/^I tap on the "(.*?)" profile option$/) do |option|
  case option
  when 'Change Profile Picture'
    begin
      on(MyProfileScreen).tap_update_profile_pic if on(MyProfileScreen).get_update_profile_pic_text == option
    rescue
      on(MyProfileScreen).tap_update_profile_pic
    end
  when 'Share Your Invite Link'
    on(MyProfileScreen).tap_share_invite_btn
  when 'Followers'
    ReusableFunction.wait_for(5)
    on(MyProfileScreen).tap_followers_txt
  when 'Following'
    ReusableFunction.wait_for(5)
    on(MyProfileScreen).tap_following_txt
  when 'Search by Username', 'Contacts', 'Facebook', 'Search for Friends'
    scroll_to_exact(option)
    on(GlobalScreenElements).tap_textview(option)
  when 'User Bio'
    id('com.bleacherreport.android.teamstream:id/txt_bio').click
  when 'My BR Photo Button - Inactive'
    on(MyBRScreen).tap_mybr_photo_btn_inactive
  when 'My BR Photo Button - Active'
    on(MyBRScreen).tap_mybr_profile_photo_active
  end
end

When(/^I tap on the overflow menu$/) do
  find_element(:xpath, "//android.widget.ImageView[@content-desc='More options']").click
end

Then(/^I am able to search for friends by "(.*?)"$/) do |option|
  case option
  when 'username'
    username = TestData.use_data "search_options", "username"

    on(MyProfileScreen).set_search_username_txtfield(username)
    ReusableFunction.wait_for(15)
    step 'the "Search For Friends - Result" screen is displayed'
  when 'verified user'
    username = TestData.use_data "search_options", "verified_user"

    on(MyProfileScreen).set_search_username_txtfield(username)
    ReusableFunction.wait_for(15)
  when 'suspended user'
    username = TestData.use_data "search_options", "suspended_user"

    on(MyProfileScreen).set_search_username_txtfield(username)
    ReusableFunction.wait_for(15)
  end
end

And(/^I tap on the search username results$/) do
  sleep 3
  on(MyProfileScreen).tap_username_txtview
end

When(/^I tap on the follow button$/) do
  on(MyProfileScreen).tap_follow_btn
end

Then(/^the followers count is "(.*?)"$/) do |option|
  case option
  when 'decremented'
    #something
  when 'incremented'
      #something
  end
end

And(/^I tap on the "(.*?)" photo option$/) do |option|
  ele = find_element(:xpath, "//android.widget.TextView[@text='#{option}']")

  case option
  when 'Take new photo'
    ele.click
  when 'Select new photo'
    ele.click
  end
end

Then(/^I am able to capture a photo for my profile on android$/) do
  ReusableFunction.wait_for(3)
  step 'I tap on the "Allow all the time" button'
  ReusableFunction.wait_for(3)
  on(GlobalScreenElements).tap_general_button('NEXT')
  # tap on the camera button
  sleep(3)
  Appium::TouchAction.new.tap(x: 720, y: 2000).perform
end

Then(/^I choose a photo for my profile on android$/) do
  ReusableFunction.wait_for(3)
  on(MyProfileScreen).tap_profile_image
end

Then(/^I tap on the Done button$/) do
  on(MyProfileScreen).tap_image_done_btn
  ReusableFunction.wait_for(7)
end

When(/^I tap on the "(.*?)" my account option$/) do |option|
  ReusableFunction.wait_for(5)
  scroll_to_exact('My Account')
  case option
  when 'username'
    on(MyProfileScreen).tap_edit_username_btn
  when 'full name'
    on(MyProfileScreen).tap_edit_fullname_btn
  when 'birthday'
      #Removed due to legal issues
  when 'phone number'
    on(MyProfileScreen).tap_edit_phone_btn
  when 'email'
    on(MyProfileScreen).tap_edit_email_btn
  end
end

Then(/^I edit my "(.*?)" from my account/) do |option|
  case option
  when 'username'
    ReusableFunction.wait_for(3)
    on(GlobalScreenElements).set_username_txtfield(ReusableFunction.generate_username)
  when 'full name'
    ReusableFunction.wait_for(3)
    step 'I provide my first name'
    step 'I provide my last name'
    step 'I close the keyboard'
  when 'birthday'
    #removed due to legal issues
  when 'phone'
    #Fixme- need to simulate code generation for phone number validation
  # when 'email' - Issue with revalidating email
  #   ReusableFunction.wait_for(2,"#{option}") {text('Email').displayed?}
  #   on(SignInScreen).set_email_txtfield(TestData.use_data('credentials','verified_email'))
  end
  on(GlobalScreenElements).tap_continue_btn
end

When(/^I provide a user bio to my profile$/) do
  @user_bio = TestData.use_data('txt_input','user_bio')
  on(EditBioScreen).tap_edit_bio_txtfield
  on(EditBioScreen).set_edit_bio_txtfield(@user_bio)
end

And(/^the user bio is shown in my profile$/) do
  ReusableFunction.wait_for(2)
  raise('User Bio is not saved') if on(MyProfileScreen).get_user_bio_txt != @user_bio
end

Then(/^the users bio is displayed with the profile$/) do
  sleep 5
  # It's intended that user jane_doe21 WILL ALWAYS have a user bio (DO NOT REMOVE)
  raise 'Missing User Bio' unless on(MyProfileScreen).verify_user_profile_bio_exists

  puts 'User Bio:' + on(MyProfileScreen).get_user_profile_bio_txt if on(MyProfileScreen).verify_user_profile_bio_exists
end

Then('the {string} user profile is shown') do |string|
  #FIXME - Revamp code
  ReusableFunction.wait_for(7)

  case string
  when 'following', 'follower'
    begin
      follower = find_elements(:id, 'com.bleacherreport.android.teamstream:id/item_container')
      img = follower[1].find_element(:id, 'com.bleacherreport.android.teamstream:id/img')
      btn_stats = follower[1].find_element(:id, 'com.bleacherreport.android.teamstream:id/btn_follow_status').text

      if btn_stats.eql?(string.capitalize)
        img.click
        begin
          id('com.bleacherreport.android.teamstream:id/bio').displayed?
          MobileDriver.snap_eyes("Verify #{string} with bio profile screen")
        rescue
          MobileDriver.snap_eyes("Verify #{string} without bio profile screen")
        end
      else
        puts "No Available #{string} Profile"
        MobileDriver.snap_eyes("Verify Connect with your squad screen")
      end
    end
  when 'username'
    username_list = find_elements(:id, 'com.bleacherreport.android.teamstream:id/username')
    name_of_user = username_list[1].name
    username_list[1].click
    raise "Wrong profile page opened" unless on(GlobalScreenElements).verify_textview_exist(name_of_user)
  end
end

When(/^I provide a user bio thats "(.*?)" characters$/) do |count|
  num = count.to_i
  rand_word = ReusableFunction.generate_random_string(num)

  on(EditBioScreen).tap_edit_bio_txtfield
  on(EditBioScreen).set_edit_bio_txtfield(rand_word)
end

Then(/^the done button is "(.*?)" from the user bio$/) do |status|
  case status
  when 'disabled'
    raise('Done button enabled') if on(GlobalScreenElements).check_action_done_btn_enabled
  when 'enabled'
    raise('Done button disabled') unless on(GlobalScreenElements).check_action_done_btn_enabled
  end
end

When (/^I tap on the More Options$/) do
  on(DashboardScreen).tap_settings_btn('More Options')
end

And(/^I verify that "([^"]*)" screen in the current screen$/) do |screen|
  case screen
  when 'Followers'
    on(GlobalScreenElements).verify_textview_contains_exist('Followers')
  when 'Following'
    on(GlobalScreenElements).verify_textview_contains_exist('Following')
  end
end