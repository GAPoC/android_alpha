Then(/^I tap on betting link$/) do
  on(ScoresScreen).tap_betting_link
  sleep 2
end

Then(/^I verify betting link is not displayed$/) do
  raise('Able to locate betting link') unless on(ScoresScreen).verify_betting_link_exist == false
end

Then(/^I tap on the first upcoming game from the top games$/) do
  find_element(:id, "com.bleacherreport.android.teamstream:id/scoreListTeam1Icon").click
end

Then(/^I verify betting link is displayed$/) do
  sleep 3
  raise("Unable to locate betting link") unless on(ScoresScreen).verify_betting_link_exist == true
end

Then(/^I scroll down till disclaimer text$/) do
  sleep 1
  begin
    count = 20
     until on(ScoresScreen).verify_disclaimer_text_exists or count == 0
     step 'I scroll down "2" time'
     count -=1
     end
  rescue
    count = 20
    until on(ScoresScreen).verify_disclaimer_text_exists or count == 0
      Appium::TouchAction.new.swipe(start_x: 500, start_y: 1200, end_x: 500, end_y: 400, duration: 800).perform
      count -=1
    end
  end
end

Then(/^I verify the disclaimer text$/) do
  begin
   on(ScoresScreen).verify_disclaimer_text_exists== true
  rescue
    on(ScoresScreen).verify_nba_wnba_disclaimer_text_exists== true
  end
end

Then(/^I launch the gamecast betting link track$/) do
  execute_script('mobile: deepLink', {'url' => 'teamstream://gamecast/iona-basketball-vs-seton-hall-basketball-2020-11-30-21-00',
                                      'package' => 'com.bleacherreport.android.teamstream'})
  sleep 5
end

Then(/^I scroll down to verify ([^"]*)$/) do |type|
  case type
  when 'odds partner label'
    count = 5
    until on(ScoresScreen).verify_odds_label_txt_exists || count == 0
      step'I scroll down "1" time'
      count -= 1
    end
    if on(ScoresScreen).verify_odds_label_txt_exists
      puts'odds betting label is displayed'
    else
      puts'odds betting label not available'
    end
  when 'no_bet_play_now button'
     step'I scroll down "1" time'
     #ReusableFunction.scroll_down until on(ScoresScreen).verify_partner_btn_exists
     if on(ScoresScreen).verify_partner_btn_exists == false
       puts'Play/Bet now not available for post games'
     end
  when 'bet_play_now button'
     step'I scroll down "1" time'
     if on(ScoresScreen).verify_partner_btn_exists == true
         puts'Play/Bet now button is displayed for pre games'
     else
       puts'Play/Bet now button is not available for pre games'
     end
  when  'odds_bet_now button'
     step'I scroll down "1" time'
     if on(ScoresScreen).verify_partner_btn_exists == true
       step 'the textview "Bet now on" is displayed'
       puts'Bet now button is displayed for pre games'
     else
       puts'Bet now button is not available for pre games'
     end
  end
end

Then(/^I launch the app from "(.*)" region$/) do |locale|
  execute_script('mobile: deepLink', {'url'=> "teamstream://geolocation/#{locale}",
                                      'package' => 'com.bleacherreport.android.teamstream'})
end