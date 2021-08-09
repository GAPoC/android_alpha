  Given(/^I navigate to the "(.*?)" tab$/) do |type|
  # Enables dodgeball streams via search
  LaunchLinks.launch_dodgeball_stream
  step 'the "Join The Team" social promo is "shown"'
  navigate_all(:using => :nav_to_home_screen)

  case type
  when 'fire'
    on(DashboardScreen).tap_fire_btn
  when 'my br'
    on(DashboardScreen).tap_my_br_btn
    on(GlobalScreenElements).interact_pop_up_alerts('Help your friends find you','No thanks') #Temporary Experiment
  when 'alerts'
    on(DashboardScreen).tap_alerts_btn
  when 'scores'
    on(DashboardScreen).tap_scores_btn
  end
  on(GlobalScreenElements).close_txt_prompt_banner_exists

  if exists{find_element(:xpath, "//android.widget.Button[@text='Skip']")}
    on(GlobalScreenElements).tap_general_button("Skip")
  end
  step 'the "Find Out Who You Know on B/R" social promo is "shown"'
  step 'the "WNBA Is Back!" social promo is "shown"'
end

  When(/^I tap on the "(.*?)" icon from toolbar menu$/) do |icon|
    ReusableFunction.wait_for(3)
    case icon
    when 'Manage Streams'
      on(MyBRScreen).tap_menu_edit_btn
    when 'profile'
      on(DashboardScreen).tap_profile_btn
    when 'search'
      on(DashboardScreen).tap_search_btn
      ReusableFunction.wait_for(5)
      begin
        on(DashboardScreen).verify_find_friends_exists
        on(GlobalScreenElements).close_txt_prompt_banner_exists
        #FIXME - Applitools Issue - Waiting for resolution from Talia
        # MobileDriver.snap_eyes("Verify #{icon} with Find Friends Icon screen")
        puts 'Did not capture screenshot. Check FIXME Status'
      rescue
        #FIXME - Applitools Issue - Waiting for resolution from Talia
        # MobileDriver.snap_eyes("Verify #{icon} screen")
        puts 'Did not capture screenshot. Check FIXME Status'
      end
    when 'settings'
      on(DashboardScreen).tap_settings_btn('More Options')
      step 'the "Find Out Who You Know on B/R" social promo is "shown"'
    when 'find friends'
      on(DashboardScreen).tap_find_friends_btn
    when 'dm inbox'
      on(DashboardScreen).tap_dm_inbox_btn
      step 'the "Find Out Who You Know on B/R" social promo is "shown"'
    when 'search for friends'
      on(DashboardScreen).tap_find_friends_search_btn
      hide_keyboard
    end
    ReusableFunction.wait_for(5)
  end

  And(/^I use the menu to search for "(.*?)"$/) do |option|
    on(DashboardScreen).set_menu_search_txtfield(option)
    ReusableFunction.wait_for(10)
    on(DashboardScreen).verify_display_name_txt_exists
    on(DashboardScreen).tap_display_name_txt
    on(GlobalScreenElements).close_txt_prompt_banner_exists
  end

  And(/^I tap the Send Feedback button$/) do
    scroll_to_exact('Send Feedback')
    on(DashboardScreen).tap_send_feedback_btn
  end

  And(/^a user account was not created$/) do
    #Ensures user account has not been created
    #Ensures user account is not signed in
    step 'I tap on the "my br" icon tab'
    step 'the "My BR - Signed Out" screen is displayed'
  end

  And(/^I enter a search term into unified search "(.*?)"$/) do |option|
    on(DashboardScreen).set_menu_search_txtfield(option)
    ReusableFunction.wait_for(10)
  end
