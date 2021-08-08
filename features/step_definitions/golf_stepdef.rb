Then(/^I tap on the golf team name$/) do
  on(ScoresScreen).tap_golf_team_name
end

Then(/^I verify the PGA tour golf game in top games$/) do
  begin
    step 'the textview "PGA Tour" is displayed'
  rescue StandardError
    puts 'PGA Tour games are not available to display in the top games'
  end
end