Then(/^"(.*?)" scores are shown if available$/) do |tab|
  begin
    on(ScoresScreen).verify_scores_no_game
    puts "No current games available for #{tab}"
  rescue
    puts "Current game shown: \nTeam #{on(ScoresScreen).get_team_name_txt} is playing"
  end
end

Then(/^I tap on the "(.*?)" scores tab picker$/) do |tab|
  # fixme static coordinates to be more dynamic
  # This script is scripted and only works for Android 8.1
  max_tab_count = 7
  counter = 0
  #on(DashboardScreen).tap_scores_btn
  ReusableFunction.wait_for(5)
  while counter < max_tab_count
    begin
      Appium::TouchAction.new.swipe(start_x: 950, start_y: 350, end_x: 900, end_y: 350, duration: 1000).perform
      find_element(:xpath, "//android.widget.TextView[@text='#{tab}']").click
      break
    rescue
      Appium::TouchAction.new.swipe(start_x: 950, start_y: 350, end_x: 100, end_y: 350, duration: 1000).perform
    end
    counter += 1
  end
end

When(/^I can switch leagues to "(.*?)"$/) do |league|
  on(ScoresScreen).tap_scores_league_txt
  on(GlobalScreenElements).tap_textview(league)
  ReusableFunction.wait_for(2)
end

And(/^I tap on the (previous|future) game date$/) do |time|
  case time
  when 'previous'
    on(ScoresScreen).tap_scores_previous_date
  when 'future'
    on(ScoresScreen).tap_scores_future_date
  end
  sleep 7
end

And(/^I verify the (previous|future) game date$/) do |time|
  case time
  when 'previous'
    on(ScoresScreen).tap_scores_previous_date
  when 'future'
    on(ScoresScreen).verify_scores_future_date
  end
  sleep 7
end

And(/^I tap on a gamecast scores list item$/) do
  list = find_elements(:id, 'com.bleacherreport.android.teamstream:id/score_list_item')

  if list.length > 0
    list[1].click
  else
    raise('No available gamecast scores')
  end
  ReusableFunction.wait_for(3)
end

When(/^I tap on the "See More" button from social module$/) do

end

Then(/^Scores widget elements are shown$/) do
  ReusableFunction.wait_for(10)
  if on(ScoresScreen).verify_scores_carousel_exists
    sport_name = id('com.bleacherreport.android.teamstream:id/scores_carousel_section_label')

    puts "Sport name: #{sport_name.text}" if sport_name.displayed?
  else
    puts 'No Score Carousel available'
  end
end

Then(/^the playoff line is shown for the "(.*?)" playoff$/) do |standing|
  ReusableFunction.wait_for(3)
  #TODO - Fix NBA Tank & MLB to be more intuitive
  MobileDriver.snap_eyes("Verify #{standing} Playoff Standing")
end

Then(/^I view a "(.*?)" gamecast$/) do |status|
  list = find_elements(:id, 'com.bleacherreport.android.teamstream:id/scoreListTeam1Icon')

  case status
  when 'completed', 'live', 'upcoming'
    if list.length > 0
      list[0].click
    else
      on(GlobalScreenElements).verify_textview_exist("No Games Today")
      puts "No Game available today"
    end
  end
end

# Soccer Gamecast Step Definition. will need to refine code logic
And(/^I view a "(.*?)" soccer gamecast$/) do |status|
  soccer_list = find_elements(:id, 'com.bleacherreport.android.teamstream:id/scoreListTeam1Icon')

  case status
  when 'completed'
    begin
      soccer_list[0].click
    rescue
      puts "No #{status} game available"
    end
  end
end

And(/^a live "(.*?)" game is inprogress$/) do |game|
  #temp code. Will require refining
  if on(ScoresScreen).verify_scores_no_game
    MobileDriver.snap_eyes("Verify No Games - #{game} Today Screen")
    puts 'No Games Today'
  else
    begin
      step 'I view a "live" gamecast'
      on(GlobalScreenElements).tap_textview('LIVE')
      MobileDriver.snap_eyes("Verify #{game.upcase} In Progress - LIVE")
      on(GlobalScreenElements).tap_textview('PLAYS')
      MobileDriver.snap_eyes("Verify #{game.upcase} In Progress - PLAYS")
      on(GlobalScreenElements).tap_textview('STATS')
      MobileDriver.snap_eyes("Verify #{game.upcase} In Progress - STATS")
      on(GlobalScreenElements).tap_textview('ODDS')
      MobileDriver.snap_eyes("Verify #{game.upcase} In Progress - ODDS")
    rescue
      puts 'Game has not begun'
    end
  end
end

Then(/^the "(.*?)" scores upcoming screen is displayed$/) do |type|
  case type
  when 'UPCOMING - PREVIEW'
    begin
      on(ScoresScreen).verify_scores_future_date_exist
      step "the '#{type}' scores screen is displayed"
    rescue
      puts "No #{type} Game"
    end
  end
end

And(/^I tap on soccer TABLE textview$/) do
  ReusableFunction.wait_for(7)
  textview = "TABLE"
  if exists{text(textview.upcase)}
    text(textview.upcase).click
  elsif exists{text(textview).click}
    text(textview).click
  else
    puts "No TABLE tab available for this game"
  end
end

Then(/^I tap on the Gamecast Standings button$/) do
  on(StreamScreen).tap_standings_gcast_btn
end

And(/^I tap on Team name$/) do
  begin
    on(ScoresScreen).tap_team_1 #selection first team stream from the game
    ReusableFunction.wait_for(5)
    on(GamecastScreenElements).verify_team_name_exists # verification in case if team doesn't have stream
  rescue
    on(ScoresScreen).tap_team_2 #selection second team stream from the game
    ReusableFunction.wait_for(5)
  end
end

And(/^I tap on "([^"]*)" tab$/) do |tabname|
  begin
    #updated due to postponed games
    on(GlobalScreenElements).verify_textview_exist("POSTPONED")
    puts "No #{tabname} tab available due to Postponed game"
  rescue
    #begin
      on(GlobalScreenElements).tap_textview(tabname)
      #rescue
      #puts "No #{tabname} tab available due to No game"
    #end
  end
end

Then(/^I tap on Standings link$/) do
  begin
    ele = find_element(:xpath, "//android.widget.TextView[@text='Standings']")
    ele.click
    step 'the "Soccer - Standing" screen is displayed'
  rescue
    puts "No Games Today"
  end
end

And(/^I tap on full recap and highlights$/) do
  step 'the textview "Full Recap & Highlights" is displayed'
  begin
    on(ScoresScreen).tap_full_recap_and_highlights
  rescue
    step 'I scroll down "1" time'
    on(ScoresScreen).tap_full_recap_and_highlights
  end
end

#Updated to general method - scroll to text in the stream
And(/^I scroll till "([^"]*)" text in the Stream$/) do |text|
  count = 0
  until on(GlobalScreenElements).verify_textview_exist_tf(text) or count == 25
    step 'I scroll down "1" time'
    count +=1
  end
  step 'I scroll down "1" time'
end

And(/^I tap on ODDS tab in the gamecast$/) do
  begin
    ele = find_element(:xpath, "//android.widget.TextView[@text='ODDS']")
    ele.click
  rescue
    puts "No odds available for this game"
  end
end