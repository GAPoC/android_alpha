Then(/^I tap on the teamstream$/) do
  sleep 1
  if find_element(:id, "com.bleacherreport.android.teamstream:id/scoreboardTeam1Icon").displayed?
    on(GamecastScreenElements).tap_teamstream_gamecast
  else
     sleep 1
     on(GamecastScreenElements).tap_teamstream_gamecast unless on(GamecastScreenElements).verify_teamstream_gamecast_exist?
  end
end

And(/^I tap on Team 1 name$/) do
  on(GamecastScreenElements).tap_team1_name
end