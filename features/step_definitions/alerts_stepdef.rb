When(/^I tap on the first activity alert$/) do
  find_element(:id, "com.bleacherreport.android.teamstream:id/activityHeadlineText").click
end

Then(/^I am redirected to the standalone view of the first activity alert$/) do
  #FIXME - Requires assertions for different types of standalone tracks
  puts 'User Redirected to a Standalone Track' if on(ArticleScreen).verify_reaction_btn_exist
  puts 'User Redirected to a User Profile' if on(MyProfileScreen).verify_username_exist
end

And(/^I select the first alert$/) do
  ReusableFunction.wait_for(3)
  on(DashboardScreen).tap_alert_article_message_btn
  sleep 2
end

When(/^I tap on the article from "(.*?)" stream$/) do |type|
  case type
  when 'alerts'
    on(ArticleScreen).tap_stream_name
  when 'articles'
    on(ArticleScreen).tap_commentary_title
  when 'tweet'
    on(TwitterScreen).tap_tweet_bird_img
  end
  sleep 5
end

Then(/^the article is shown from "(.*?)" stream$/) do |text|
  MobileDriver.snap_eyes("Verify Article - #{text} Stream")
end

And(/^I react to an article with a fire$/) do
  on(DashboardScreen).tap_alert_btn_fire
end

Then(/^I verify the Alert Tab Badge functionality$/) do
  if on(AlertsScreen).alert_badge_exist
    icon_num = on(AlertsScreen).get_alert_badge_text # Getting number of the new alerts from Alert Icon Badge
    step 'I tap on the "alerts" icon tab'
    step 'the "Find Out Who You Know on B/R" social promo is "shown"'
    tab_num = on(AlertsScreen).get_alert_badge_text # Getting number of the new alerts from Alert Activity tab Badge
    if icon_num == tab_num
      puts "Badge alert present on Alert icon #{icon_num} and Alert Tab #{tab_num} "
    else
      fail("Alert Barge icon #{icon_num} number doesn't match to the Alert Tab icon #{tab_num}")
    end
  else
    step 'I tap on the "alerts" icon tab'
    step 'the "Find Out Who You Know on B/R" social promo is "shown"'
    if on(AlertsScreen).alert_badge_exist #Negative scenario, if Alerts doesn't shown on Home page but shown in the Alerts page
      fail("Alert Badge present on Alert Activity but doesn't on the Alert icon")
    else
      puts "No Alerts Badge"
    end
  end
end

Then(/^I verify the Alert Tab Badge reset after alerts view$/) do
  if on(AlertsScreen).alert_badge_exist
    fail("Alert Badge exist after Alert Activity viewed")
  else
    puts "Alert Tab Badge reset after alerts view"
  end
end