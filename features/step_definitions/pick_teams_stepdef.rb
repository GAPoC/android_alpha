Given(/^I decide to pick teams$/) do
  on(WelcomeScreen).tap_pick_teams_btn
end

When(/^I search for "(.*?)"$/) do |search|
  on(ChooseYourTeamScreen).search_and_choose(search)
end

Then(/^the user is redirected to the home screen$/) do
  on(DashboardScreen).verify_home_btn_exist
end

Then(/^I am redirected to choose my team$/) do
  sleep 5
  team = TestData.use_data('test_stream','dodgeball')
  on(ChooseYourTeamScreen).search_and_choose(team)
  if on(GlobalScreenElements).check_done_btn_enabled?
    on(GlobalScreenElements).tap_done_btn
  else
    on(GlobalScreenElements).tap_navigate_up_btn
  end

  begin
    on(GlobalScreenElements).tap_done_btn if on(GlobalScreenElements).get_toolbar_title == 'Notifications'
  rescue
    puts 'Notifications screen not shown'
  end
end

And(/^I enter "(.*?)" list$/) do |players|
  ReusableFunction.wait_for(25)
  scroll_to(players)
  on(GlobalScreenElements).tap_textview(players)
  sleep 3
  id("com.bleacherreport.android.teamstream:id/label").click
end

Then(/^the local teams are shown to the user$/) do
  #FIXME - Set location to enable this test
  # Selenium::WebDriver::DriverExtensions.new(set_location(37.77, -122.43, 18))
  sleep 3
  on(ChooseYourTeamScreen).tap_show_local_team_btn
  on(GlobalScreenElements).tap_allow_permission
  MobileDriver.snap_eyes('Verify Local Team Screen')
end

And(/^I search a name "([^"]*)"$/) do |name|
  on(ChooseYourTeamScreen).search_name(name)
end