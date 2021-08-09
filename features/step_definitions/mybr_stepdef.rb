When(/^I tap on the add button from my teams$/) do
  ReusableFunction.wait_for(5)
  on(MyBRScreen).tap_add_team_btn
end

Then(/^the '(.*?)' I added is displayed in my teams$/) do |team|
  begin
    on(GlobalScreenElements).verify_textview_exist(team)
  rescue
    raise("Unable to locate #{team} element")
  end
end

Then(/^I remove all the teams I've added from my teams$/) do
  on(MyBRScreen).delete_all_my_teams
end

When(/^I add a '(.*?)' to my teams$/) do |team|
 on(MyBRScreen).add_a_team(team)
end

Then(/^I can remove the '(.*?)' from my teams$/) do |team|
  on(MyBRScreen).remove_specific_team(team)
end

Then(/^the "(.*?)" I removed is not displayed in my teams$/) do |team|
  raise("Able to locate #{team} element") if on(MyBRScreen).get_team_name_label.include? team
end

Then(/^I am able to add "(.*?)" to my teams$/) do |team|
  if on(GlobalScreenElements).get_snackbar_txt == "Add #{team}"
    on(GlobalScreenElements).tap_snackbar_txt
  else
    raise("Unable to find #{team} element. Implemented: #{on(GlobalScreenElements).get_snackbar_txt}")
  end
end

And(/^I tap on the "(.*?)" icon tab/) do |icon|
  sleep 3
  case icon
  when 'home'
    on(DashboardScreen).tap_home_btn
    on(GlobalScreenElements).close_txt_prompt_banner_exists
    step 'the "New Public Profiles" social promo is "shown"'
  when 'fire'
    on(DashboardScreen).tap_fire_btn
    on(GlobalScreenElements).close_txt_prompt_banner_exists
    MobileDriver.snap_eyes('Verify Fire Screen')
  when 'my br'
    on(DashboardScreen).tap_my_br_btn
    on(GlobalScreenElements).close_txt_prompt_banner_exists
    on(GlobalScreenElements).interact_pop_up_alerts('Help your friends find you','No thanks') #Temporary Experiment
    step 'the "Find Out Who You Know on B/R" social promo is "shown"' #A/B Testing
  when 'alerts'
    on(DashboardScreen).tap_alerts_btn
    on(GlobalScreenElements).close_txt_prompt_banner_exists
  when 'scores'
    on(DashboardScreen).tap_scores_btn
    on(GlobalScreenElements).close_txt_prompt_banner_exists
  end
  sleep 5
  step 'the "Find Out Who You Know on B/R" social promo is "shown"'
  if exists{find_element(:xpath, "//android.widget.Button[@text='Skip']")}
    on(GlobalScreenElements).tap_general_button("Skip")
  end
  ReusableFunction.wait_for(5)
end

Then(/^I tap on "(.*?)" from my teams$/) do |team|
  ReusableFunction.wait_for(3)
  on(GlobalScreenElements).tap_textview(team)
end

And(/^the my br feed screen is displayed$/) do
  begin
    on(GlobalScreenElements).verify_btn_exist('Post')
    MobileDriver.snap_eyes('Verify My BR - Signed In')
    puts 'Signed In'
  rescue
    MobileDriver.snap_eyes('Verify My BR - Signed Out')
  end
end