Given(/^the welcome screen is bypassed$/) do
  raise("Welcome Activity screen is shown") if on(WelcomeScreen).verify_pick_teams_btn_exist
end

Then (/^I am following the pre-subscribed streams$/) do
  if on(ScoresScreen).verify_scores_carousel_label
    MobileDriver.snap_eyes('Verify Pre-Subscribed Teams with Scores Carousel Screen')
  else
    MobileDriver.snap_eyes('Verify Pre-Subscribed Streams')
  end
end

Then(/^breaking news is the only notification enabled$/) do
  scroll_to('Breaking News')
  MobileDriver.snap_eyes('Verify Breaking News Enabled Screen')
end

When(/^I tap on the "(.*?)" upsell button$/) do |btn_txt|
  #TODO
end

And('I accept the GDPR rules by default') do
  begin
    on(GlobalScreenElements).tap_general_button('Accept and Continue')
    ReusableFunction.wait_for(3)
    on(GlobalScreenElements).tap_general_button('Accept and Save Settings')
  rescue
    puts 'No GDPR Rules Shown'
  end
end