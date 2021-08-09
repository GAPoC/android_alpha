Then(/^I tap on the How To Play button$/) do
  on(BetCenterScreen).tap_howt_play_btn
end

And(/^I complete NEW bet pack$/) do
  if on(BetCenterScreen).verify_pack_state_txt_exists
    state = on(BetCenterScreen).pack_state_text
    if state == 'NEW'
      on(GlobalScreenElements).tap_textview('NEW')
      counter = 6
      until counter == 0 || on(GlobalScreenElements).verify_textview_exist_tf('Done')
        step 'I scroll down "1" time'
        on(BetCenterScreen).tap_pick_answer_btn
        on(GlobalScreenElements).tap_textview('CONFIRM')
        sleep 3
        counter-= 1
      end
      step 'I scroll down "1" time'
      on(BetCenterScreen).tap_pick_answer_btn
      on(GlobalScreenElements).tap_textview('CONFIRM')
      sleep 3
      puts 'New Pick Pack completed successfully'
    elsif state == 'UPCOMING'
      puts 'Currently only packs in Upcoming state are available'
    end
  elsif on(BetCenterScreen).verify_no_packs_txt_exists
    puts 'No New Picks Yet'
  else
    raise 'Error: No New or Upcoming or No new pick yet state'
  end
end

And(/^I tap game link$/) do
  counter = 0
  while counter < 6
    begin
      on(BetCenterScreen).tap_bet_gamecast_link
      step 'I verify that Gamecast screen is the current screen'
      step 'I tap on the "Bet Center" button'
      step 'the "Bet Center" screen is displayed'
      break
    rescue
      ReusableFunction.scroll_up
      counter += 1
    end
  end
  if on(BetCenterScreen).verify_bet_gamecast_link_exist
    puts 'The card with Gamecast link exist'
  else
    puts 'No cards today with Gamecast link'
  end
end

Then(/^I verify that Gamecast screen is the current screen$/) do
  begin
    on(GlobalScreenElements).verify_textview_exist('PREVIEW')
  rescue
    on(GlobalScreenElements).verify_textview_exist('LIVE')
  rescue
    on(GlobalScreenElements).verify_textview_exist('RECAP')
  end
end

And(/^I tap on Skip or Next button until Done button will be available$/) do
  #If Bet card is not locked will be shown the Skip button, otherwise Next button
  counter = 4 #4 Bet card will have a Skip or Next button, fifth one will have a Done button
  until counter > 0
    begin
      on(GlobalScreenElements).tap_textview('Skip')
    rescue
      on(GlobalScreenElements).tap_textview('Next')
    end
    counter -= 1
  end
  on(GlobalScreenElements).verify_textview_exist('Done')
end

And(/^I verify that Perfect Picks screen is the current screen$/) do
  sleep 5
  step 'the How the Game Work pop up shown'
  step 'the "Find Out Who You Know on B/R" social promo is "shown"'
  on(GlobalScreenElements).verify_toolbar_title('Perfect Picks')
end

Then(/^I tap on Perfect Picks icon$/) do
  begin
    on(GlobalScreenElements).tap_textview('Perfect Picks')
    sleep 3
    step 'the "⚾️ MLB Perfect Picks Coming" social promo is "shown"'
    step 'the How the Game Work pop up shown'
  rescue
    step 'I tap on the "home" icon tab'
    step 'I tap on the "my br" icon tab'
    on(GlobalScreenElements).tap_textview('Perfect Picks')
    sleep 3
    step 'the How the Game Work pop up shown'
  end
end

And(/^I tap on pack from Recent$/) do
  on(BetCenterScreen).tap_recent_pack_state
  sleep 3
end

And(/^I verify that Bet card screen is the current screen$/) do
  on(BetCenterScreen).verify_pick_answer_btn
end

And(/^I do not complete NEW bet pack$/) do
  if on(BetCenterScreen).verify_pack_state_txt_exists
    state = on(BetCenterScreen).pack_state_text
    if state == 'NEW'
      on(GlobalScreenElements).tap_textview('NEW')
      step 'the "Bet Card NEW" screen is displayed'
      on(BetCenterScreen).tap_toolbarUp_btn
      sleep 3
      raise 'Error: No NEW packs' if on(GlobalScreenElements).verify_textview_exist('NEW') == false
    elsif state == 'UPCOMING'
      puts 'Currently only packs in Upcoming state are available'
    end
  elsif on(BetCenterScreen).verify_no_packs_txt_exists
    puts 'No New Picks Yet'
  else
    raise 'Error: No New, Upcoming or No new pick yet state'
  end
end

And(/^I complete the community selection with "(.*?)" suggested teams$/) do |element|
  if on(BetCenterScreen).verify_pack_state_txt_exists
    state = on(BetCenterScreen).pack_state_text
    if state == 'NEW'
      on(GlobalScreenElements).tap_textview('NEW')
      sleep 2
      counter = 0
      while counter < 6
        if on(GlobalScreenElements).verify_textview_exist_tf('Pick your team to play against other fans and win prizes')
          break
        else
          step 'I scroll down "1" time'
          on(BetCenterScreen).tap_pick_answer_btn
          step 'the textview "CONFIRM" is displayed'
          on(GlobalScreenElements).tap_textview('CONFIRM')
          sleep 5
          counter += 1
        end
      end
      case element.downcase
      when 'no'
        step 'the "Pick Your Team - No suggested teams" screen is displayed'
      when 'two'
        step 'the "Pick Your Team - Two suggested teams" screen is displayed'
        on(BetCenterScreen).tap_community_name
        on(BetCenterScreen).tap_join_team_btn
        step 'the "Winners Dont Quit! sing up" screen is displayed'
      end
    elsif state == 'UPCOMING'
      puts 'Currently only packs in Upcoming state are available'
    end
  elsif on(BetCenterScreen).verify_no_packs_txt_exists
    puts 'No New Picks Yet'
  else
    raise 'Error: No New, Upcoming or No new pick yet state'
  end
end


Then(/^I proceed to the pack but not complete it$/) do
  if on(BetCenterScreen).verify_pack_state_txt_exists
    state = on(BetCenterScreen).pack_state_text
    if state == 'NEW'
      on(GlobalScreenElements).tap_textview('NEW')
      on(BetCenterScreen).tap_toolbarUp_btn
      step 'the "Your Picks are Almost In pop up" screen is displayed'
      step 'I tap on "Leave Game" textview'
      step 'I verify that Perfect Picks screen is the current screen'
    elsif state == 'UPCOMING'
      puts 'Currently only packs in Upcoming state are available'
    end
  elsif on(BetCenterScreen).verify_no_packs_txt_exists
    puts 'No New Picks Yet'
  else
    raise 'Error: No New, Upcoming or No new pick yet state'
  end
end

Given(/^I sign in to use the Perfect Picks$/) do
  # Enables dodgeball streams via search
  LaunchLinks.launch_dodgeball_stream
  #Sign In Steps
  on(WelcomeScreen).tap_sign_in_btn
  on(SignInScreen).sign_in_with_bet_email
  ReusableFunction.hide_keyboard_option
  on(GlobalScreenElements).tap_continue_btn
  step 'I am redirected to choose my team'
  sleep 10
  step 'the "New Public Profiles" social promo is "shown"'
  on(DashboardScreen).tap_home_btn
  sleep 3
end

Then(/^the No Past Result button is displayed$/) do
  raise 'ERROR: Past result button shows for not logged in user' if on(BetCenterScreen).verify_past_results_btn
end

And(/^I verify the Perfect Pick entry point on team stream$/) do
  ReusableFunction.wait_for(7)
  count = 15
  until on(GlobalScreenElements).verify_textview_contains_exist('Perfect Picks') || count == 0
    step 'I scroll down "1" time'
    count -= 1
  end
  if on(GlobalScreenElements).verify_textview_contains_exist('Perfect Picks')
    find_element(:xpath, '//android.widget.TextView[contains(@text, "Perfect Picks")]').click
    step 'I verify that Perfect Picks screen is the current screen'
  else
    puts 'NO Perfect Picks post in the stream'
  end
end

And(/^I complete NEW bet pack for multi league - "([^"]*)"$/) do |sport|
  if on(GlobalScreenElements).verify_textview_exist_tf(sport)
    on(GlobalScreenElements).tap_textview(sport)
    sleep 2
    step 'the How the Game Work pop up shown'
    step 'I complete NEW bet pack'
    case sport
    when 'NFL'
      step 'the "PP tab NFL" screen is displayed'
    when 'NBA'
      step 'the "PP tab NBA" screen is displayed'
    when 'MLB'
      step 'the "PP tab MLB" screen is displayed'
    when 'NHL'
      step 'the "PP tab NHL" screen is displayed'
    when 'Pregame'
      step 'the "PP tab Pregame" screen is displayed'
    when 'MMA'
      step 'the "PP tab MMA" screen is displayed'
    when 'Wrestling'
      step 'the "PP tab Wrestling" screen is displayed'
    when 'Tennis'
      step 'the "PP tab Tennis" screen is displayed'
    when 'Boxing'
      step 'the "PP tab Boxing" screen is displayed'
    when 'WF'
      step 'the "PP tab WF" screen is displayed'
    when 'Golf'
      step 'the "PP tab Golf" screen is displayed'
    when 'Horses'
      step 'the "PP tab Horses" screen is displayed'
    when 'Gaming'
      step 'the "PP tab Gaming" screen is displayed'
    end
  else
    puts "No #{sport} tabs in Bet center"
  end
end

Then(/^I verify the RECENT part functionality$/) do
  if on(GlobalScreenElements).verify_textview_exist_tf('A new round is in progress')
    step 'I scroll down "2" time'
    if on(GlobalScreenElements).verify_textview_exist_tf('RECENT')
      step 'I tap on pack from Recent'
      step 'I verify that Bet card screen is the current screen'
      sleep 3
      on(BetCenterScreen).tap_toolbarUp_btn
    else
      puts 'No RECENT due to New Round state'
    end
  else
    step 'I scroll down "2" time'
    step 'I tap on pack from Recent'
    step 'I verify that Bet card screen is the current screen'
  end
end

Then(/^I verify the RECENT part functionality for "([^"]*)" tab$/) do |tab|
  case tab
  when 'NFL'
    team = 'NFL Draft'
  when 'NBA'
    team = 'Lakers'
  when 'MLB'
    team = 'Athletics'
  when 'NHL'
    team = 'Avalanche'
  when 'Pregame'
    team = 'Pregame'
  when 'Wrestling'
    team = 'Wrestling'
  when 'MMA'
    team = 'MMA'
  when 'WF'
    team = 'UEFA'
  end
  if on(GlobalScreenElements).verify_textview_exist_tf(tab)
    on(GlobalScreenElements).tap_textview(tab)
    sleep 2
    step 'the How the Game Work pop up shown'
    on(GlobalScreenElements).verify_textview_exist(team)
    step 'I verify the RECENT part functionality'
    on(BetCenterScreen).tap_toolbarUp_btn
    ReusableFunction.scroll_down
    Appium::TouchAction.new.swipe(start_x: 500, start_y: 400, end_x: 500, end_y: 1400, duration: 600).perform
  else
    puts "No #{tab} tabs in Bet center"
  end
end

And(/^I verify the Leaderboards button disabled for "([^"]*)"$/) do |tab|
  if on(GlobalScreenElements).verify_textview_exist_tf(tab)
    on(GlobalScreenElements).tap_textview(tab)
    sleep 2
    step 'the How the Game Work pop up shown'
    step 'I verify the "Leaderboard" button disabled'
  else
    puts "No #{tab} tabs in Bet center"
  end
end

Then(/^I verify that Perfect Picks card present in the Stream carousel$/) do
  step 'the textview "Perfect Picks" is displayed'
  step 'the textview "Compete and win prizes" is displayed'
end

And(/^the How the Game Work pop up shown$/) do
  if on(GlobalScreenElements).verify_textview_exist_tf('How the Game Works')
    puts 'How the Game Works pop up exist'
    on(GlobalScreenElements).tap_textview('Got It')
    sleep 3
  else
    puts 'No How the Game Works popup'
  end
end

Then(/^I scroll to the "([^"]*)" tab in the Bet center$/) do |sport|
  Appium::TouchAction.new.swipe(start_x: 100, start_y: 300, end_x: 950, end_y: 300, duration: 1000).perform #The scroll to the first tab
  counter = 0
  while counter < 4
    if on(GlobalScreenElements).verify_textview_exist_tf(sport)
      puts "#{sport} tab exists"
      break
    else
      Appium::TouchAction.new.swipe(start_x: 950, start_y: 300, end_x: 100, end_y: 300, duration: 1000).perform #tepmroraly solution
    end
    counter += 1
  end
end

Then(/^I verify the betting link & disclaimer part functionality for "([^"]*)" tab$/) do |tab|
  if on(GlobalScreenElements).verify_textview_exist_tf(tab)
    on(GlobalScreenElements).tap_textview(tab)
    sleep 2
    step 'the How the Game Work pop up shown'
    step 'I scroll till "Play now on" text in the Stream'
    begin
      on(BetCenterScreen).verify_betting_logo
    rescue
      step 'I scroll down "1" time'
      raise('Unable to locate betting link') unless on(BetCenterScreen).verify_betting_logo
    end
    step 'I scroll down till disclaimer text'
    begin
      on(GlobalScreenElements).verify_textview_exist(TestData.use_data('bet_disclaimer','fanduel'))
    rescue
      on(GlobalScreenElements).verify_textview_exist(TestData.use_data('bet_disclaimer','draftking'))
    end
    Appium::TouchAction.new.swipe(start_x: 500, start_y: 400, end_x: 500, end_y: 1400, duration: 600).perform
  else
    puts "No #{tab} tabs in Bet center"
  end
end

And(/^I verify the Perfect Pick Winner Track on the Stream$/) do
  count = 15
  # Loops and scrolls to See How you did verification
  until on(GlobalScreenElements).verify_textview_exist_tf('See How You Did') || count.zero?
    step 'I scroll down "1" time'
    count -= 1
  end

  # Verifies the See How You did element exist
  if on(GlobalScreenElements).verify_textview_exist_tf('See How You Did')
    step 'I tap on "See How You Did" textview'
    step 'the How the Game Work pop up shown'
    on(GlobalScreenElements).verify_textview_exist('RESULTS')
    on(GlobalScreenElements).verify_textview_exist('LEADERBOARD')
    step 'I tap on the navigate back button'
  else
    puts 'No Perfect Pick Winner track in the Stream'
  end
end

And(/^I verify the Official Rules details$/) do
  if on(GlobalScreenElements).verify_textview_exist_tf('Prizes eligible for U.S. residents only. See Official Rules for details')
    puts 'Prizes eligible for U.S. residents only. See Official Rules for details text displayed'
  elsif on(GlobalScreenElements).verify_textview_exist_tf('Prizes eligible for U.S. residents only. See Official Rules for details.')
    puts 'Prizes eligible for U.S. residents only. See Official Rules for details. - text displayed'
  elsif on(GlobalScreenElements).verify_textview_exist_tf('Prizes eligible for U.S. only. See Official Rules for details')
    puts 'Prizes eligible for U.S. only. See Official Rules for details - text is displayed'
  else
    raise 'Error: NO Official Rules'
  end
end

And(/^I verify the Bet Track "([^"]*)" for the nonlegal state$/) do |type|
  count = 10
  until on(BetCenterScreen).verify_bet_track or count == 0
    step 'I scroll down "1" time'
    count -= 1
    Appium::TouchAction.new.swipe(start_x: 500, start_y: 800, end_x: 500, end_y: 600, duration: 1000).perform
  end
  case type
  when 'UI'
    if on(BetCenterScreen).verify_bet_track
      #Need to add applitools verification step when will be fixed QA-8666
      on(BetCenterScreen).verify_bet_team1_btn == false
      on(BetCenterScreen).verify_bet_team2_btn == false
      puts 'Bet track are shown without bet buttons due to restrictions'
    else
      puts 'No Bet Tracks in the stream currently'
    end
  when 'functionality'
    if on(BetCenterScreen).verify_bet_track
      find_element(:xpath, "//android.widget.TextView[contains(@text, 'Moneyline')]").click
      on(GlobalScreenElements).verify_toolbar_title_exist?
    else
      puts 'No Bet Tracks in the stream currently'
    end
  end
end

And(/^I verify the Bet Track info modal$/) do
  count = 10
  until on(BetCenterScreen).verify_bet_track or count == 0
    step 'I scroll down "1" time'
    count -= 1
    Appium::TouchAction.new.swipe(start_x: 500, start_y: 800, end_x: 500, end_y: 600, duration: 1000).perform
  end
  if on(BetCenterScreen).verify_bet_track
    on(BetCenterScreen).tap_bet_info
    step 'the "Bet Info Pop Up" screen is displayed'
  else
    puts 'No Bet Tracks in the stream currently'
  end
end