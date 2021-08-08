Then(/^the article "(.*?)" title is displayed$/) do |title_type|
  case title_type
  when 'commentary'
    begin
      on(ArticleScreen).verify_commentary_title_exist
    rescue
      on(ArticleScreen).verify_exists_tweet_username
    end
  when 'article'
    on(ArticleScreen).verify_stream_name_exist
  end
end

Then(/^the user is shown that the alert feed is "(.*?)"$/) do |type|
  case type
  when 'empty', 'active'
      logos = find_elements(:id, 'com.bleacherreport.android.teamstream:id/associated_stream_logo')
      if logos.length > 0
        puts 'Alerts Shown'
        MobileDriver.snap_eyes('Verify Alerts Screen')
      else
        puts 'Alerts Feed Empty'
        MobileDriver.snap_eyes('Verify Empty Alerts Feed Stream')
      end
  end
end

And(/^I decide to save an article for later$/) do
  find_element(:uiautomator, 'new UiScrollable(new UiSelector().scrollable(true).instance(0)).scrollIntoView(new UiSelector().description("Bookmark"))')
  on(ArticleScreen).tap_bookmark_btn
  @txt = on(ArticleScreen).get_commentary_title_text
end

Then(/^the saved article is shown$/) do
  on(ArticleScreen).verify_commentary_title_text(@txt)
end

Then(/^I tap on the "(.*?)" team option$/) do |team|
  ReusableFunction.wait_for(3)
  on(GlobalScreenElements).tap_textview(team)
end

And(/^I tap on the "(.*?)" icon from the article$/) do |icon|
  ReusableFunction.wait_for(5)
  begin
    case icon
    when 'fire'
      on(ArticleScreen).tap_reaction_btn
    when 'comment'
      #comment button removed (HUDDLE-136)
      count = 7
      until exists{find_element(:id, "txt_comment_count")} or count == 0
        ReusableFunction.scroll_up
        count -= 1
      end
      ReusableFunction.scroll_up
      on(CommentScreen).tap_comment_count
    when 'share'
      on(ArticleScreen).tap_share_btn
    end
  rescue
    puts 'No available alerts'
  end
end

Then(/^I "(.*?)" with a fire$/) do |reaction|
  begin
    find_element(:xpath, "//android.widget.TextView[@text='Reply']")
  rescue
    ReusableFunction.scroll_up
  end
  @reaction = on(CommentScreen).get_comment_reaction_count
  puts @reaction
  case reaction
  when 'react'
    count = 3
    until on(ArticleScreen).verify_reaction_btn_exist or count == 0
      ReusableFunction.scroll_up
      count -= 1
    end
    if !@reaction.include? 'You'
      puts('Already fired')
    else
      on(ArticleScreen).tap_reaction_btn
      ReusableFunction.wait_for(7)
    end

  when 'unreact'
    if @reaction.include? 'You'
    on(ArticleScreen).tap_reaction_btn
    ReusableFunction.wait_for(7)
    else
      puts('Has not been fired')
    end
  end
end

Then(/^the reaction count is updated$/) do
  ReusableFunction.wait_for(3)
  MobileDriver.snap_eyes('Verify Updated Reaction Count')
end

When(/^I tap on the reaction count$/) do
  begin
    on(CommentScreen).tap_reaction_count
  rescue
    ReusableFunction.scroll_up
    on(CommentScreen).tap_reaction_count
  end
end

Then(/^the "(.*)" is (not displayed|displayed)$/) do |type,status|
  case status
  when 'not displayed'
    MobileDriver.snap_eyes("Verify #{type} is not Displayed")
  when 'displayed'
    MobileDriver.snap_eyes("Verify #{type} Displayed")
  end
end

When(/^I tap on the twitter "(.*?)" option$/) do |type|
  sleep 3

  begin
    on(TwitterScreen).verify_tweet_bird_img_exist
    @username = on(TwitterScreen).get_tweet_username_txt

    case type
    when 'avatar'
      on(TwitterScreen).tap_tweet_profile_img
    when 'View on Twitter'
      step 'I tap on "View On Twitter" textview'
    when 'image'
      # Pending
    end

  rescue
    puts 'First article is not a tweet'
  end
end

Then(/^I am redirected to the twitter web view$/) do
  ReusableFunction.wait_for(4)
  begin
    text(@username).displayed?
  rescue
    puts 'First article is not a tweet'
  end
end

And('I tap on the {string} icon from the alert') do |text|
  ReusableFunction.wait_for(3)
  case text
  when 'comment'
    comments = find_elements(:id, 'com.bleacherreport.android.teamstream:id/btn_conversation')

    begin
      comments[0].click
      MobileDriver.snap_eyes('Verify Join The Conversation Screen')
    rescue
      puts 'There are no available alerts to comment'
    end
  when 'share'
    begin
      on(ArticleScreen).tap_share_btn
      MobileDriver.snap_eyes('Verify Share This Article Screen')
    rescue
      puts 'There are no available alerts to share'
    end
  end
end

And(/^I tap on the share DM button$/) do
  counter = 0
  while counter < 5
    if on(ArticleScreen).verify_share_dm_btn_exist
      Appium::TouchAction.new.swipe(start_x: 500, start_y: 1200, end_x: 500, end_y: 800, duration: 800).perform
      break
    end
    ReusableFunction.scroll_up
    counter += 1
  end
  on(ArticleScreen).tap_share_dm_btn
end

And(/^I tap on the DM button in the external share bar$/) do
  find_element(:xpath, "//android.widget.ImageButton[@content-desc=\"Share\"]").click
end

Then(/^I tap on the DM share close button$/) do
  on(ArticleScreen).tap_share_dm_close
end

Then(/^I fire a comment in a conversation feed$/) do
  fire = find_elements(:id, 'com.bleacherreport.android.teamstream:id/fire_button')

  if fire[0].displayed?
    fire[0].click
  else
    puts 'No comment in conversation field'
  end
end

Then(/^the textview article comment button is displayed$/) do
  on(ArticleScreen).verify_conversation_btn
end

Then(/^the textview share DM is displayed$/) do
  on(ArticleScreen).verify_share_dm_btn_exist
end

Then(/^the textview share is displayed$/) do
  on(ArticleScreen).verify_share_btn_exist
end

And(/^I tap on user reaction counts$/) do
  count = 5
  until on(ArticleScreen).user_reaction_counts_exists or count == 0
    ReusableFunction.scroll_up
    count -= 1
  end
  begin
    on(ArticleScreen).tap_user_reaction_counts
  rescue StandardError
    ReusableFunction.scroll_up
    on(ArticleScreen).tap_user_reaction_counts
  end
end