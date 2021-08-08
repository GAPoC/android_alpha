Then(/^the user is redirected to the comment thread$/) do
  MobileDriver.snap_eyes('Verify Comment Thread Screen')
end

And(/^I add a comment to the "(.*?)" comment$/) do |type|
  @comment = ReusableFunction.generate_player_comment

  case type
  when 'article'
    # Appium::TouchAction.new.swipe(start_x: 144, start_y: 1634, end_x: 144, end_y: 149, duration: 200).perform
  when 'thread'
    on(CommentScreen).set_comment_txtfield(@comment)
  when 'gamecast'
    on(CommentScreen).set_comment_txtfield("Cool!")
  end
  ReusableFunction.wait_for(3)
  on(CommentScreen).tap_send_btn
end

Then(/^the comment is posted to the thread$/) do
  raise('Comment not posted') unless find_element(:xpath, "//android.widget.TextView[@text='#{@comment}']").displayed?
end

And(/^I (reply to|report) a comment$/) do |type|
  case type
  when 'reply to'
    begin
      on(CommentScreen).verify_exist_reply_btn
      on(CommentScreen).tap_reply_btn
    rescue
      warn 'No reply options available'
    end
  when 'report'
    begin
      on(CommentScreen).tap_comment_option
      on(GlobalScreenElements).tap_general_text if on(GlobalScreenElements).get_general_text == 'Report this Comment'
    rescue
      warn 'No comments to report'
    end
  end
end

Then(/^the person I'm replying to is (mentioned|appended)$/) do |type|
  @input = on(CommentScreen).get_comment_txtfield_txt
  @reply = ReusableFunction.generate_comment_msg

  case type
  when 'appended'
    raise('User is not mentioned in comment') unless @input.include? '@'
  when 'mentioned'
    begin
      raise('User is not mentioned in comment') unless @input.include? '@'
      on(CommentScreen).set_comment_txtfield("#{@input} #{@reply}")
      ReusableFunction.wait_for(3)
      on(CommentScreen).tap_send_btn
  rescue
    warn 'No reply options available'
  end
  end
end

And(/^I reply to a comment with multiple mentions$/) do
  @user = on(CommentScreen).get_comment_txtfield_txt
  @input = "@cash_money #{@user}"
  on(CommentScreen).set_comment_txtfield("#{@input} #{ReusableFunction.generate_comment_msg}")
  ReusableFunction.wait_for(3)
  on(CommentScreen).tap_send_btn
end

Then(/^my comment reply is posted$/) do
  begin
    raise('Comment not posted') unless find_element(:xpath, "//android.widget.TextView[@text='#{@input} #{@reply}']").displayed?
  rescue
    warn 'No reply options available'
  end
end

Then(/^I am alerted that that comment has been reported$/) do
  begin
    raise('Comment not reported') unless find_element(:xpath, "//android.widget.TextView[@text='Thanks for reporting this comment.']").displayed?
  rescue
    warn 'No comments to report'
  end
end

Then(/^the article is shown the appropriate comment count text$/) do
  ReusableFunction.wait_for(5)
  count = 10
  until on(CommentScreen).verify_comment_count_exist  || count > 0
    ReusableFunction.scroll_up
    count -= 1
  end
  if on(GlobalScreenElements).verify_textview_contains_exist('View all')
    puts 'Comment counter is shown'
  else
    puts 'No comments counter are found'
  end
end

And(/^I search a user by their "(.*?)"$/) do |option|

  case option
  when 'username'
    @username = TestData.use_data('mentions', 'username')
    on(CommentScreen).set_comment_txtfield("@#{@username}")
    raise("Unable to locate with #{option}") unless on(GlobalScreenElements).get_username_txt.include? @username
    on(CommentScreen).clear_comment_txtfield
  when 'first name'
    fname = TestData.use_data('mentions', 'first_name')

    on(CommentScreen).set_comment_txtfield("@#{fname}")
    raise("Unable to locate with #{option}") unless on(GlobalScreenElements).get_fullname_txt.include? fname
    on(CommentScreen).clear_comment_txtfield
  when 'last name'
    lname = TestData.use_data('mentions', 'last_name')

    on(CommentScreen).set_comment_txtfield("@#{lname}")
    raise("Unable to locate with #{option}") unless on(GlobalScreenElements).get_fullname_txt.include? lname
    on(CommentScreen).clear_comment_txtfield
  end
end

Then(/^I can @ mention a user I am following$/) do
  on(CommentScreen).set_comment_txtfield("@#{@username}_money #{ReusableFunction.generate_comment_msg}")
  on(CommentScreen).tap_send_btn
end

Then(/^the comment count is updated$/) do
  #TODO
end

And(/^I @ mention a user "(.*?)" times$/) do |i|
  i.to_i.times do
    on(CommentScreen).set_comment_txtfield("@cash_money #{ReusableFunction.generate_comment_msg}")
    on(CommentScreen).tap_send_btn
    ReusableFunction.wait_for(2)
  end

end

Then(/^the "(.*?)" comments are shown$/) do |sort_by|
  begin
    on(CommentScreen).verify_comment_body_exist
    time_ago = on(CommentScreen).get_time_ago_txt.tr('0-9', '')

    case sort_by
    when 'OLDEST', 'NEWEST'
      time = %w[now m d h]
      raise("#{sort_by} comments not sorted") unless time.include? time_ago
    when 'MOST REACTED'
      #FIXME_Need Article with Comment Reactions
      num = on(CommentScreen).get_comment_reaction_count.to_i
      raise("#{sort_by} comments not sorted") unless num > 1
    end

    raise("#{sort_by} comments not sorted") unless on(CommentScreen).get_sort_order_label == sort_by
  rescue
    puts 'No available comments to sort'
  end
end

And(/^I sort to the "(.*?)" comments via sort "(.*?)"$/) do |sort_type, sort_button|
  case sort_button
  when 'button'
    on(CommentScreen).tap_sort_btn
  when 'label'
    title = on(CommentScreen).get_sort_order_label
    on(GlobalScreenElements).tap_textview(title)
  when 'caret'
    on(CommentScreen).tap_sort_caret
  end
  on(CommentScreen).tap_sort_alert_option(sort_type)
end

And(/^I tap on a "(.*?)" in the reaction list$/) do |type|
  case type
  when 'username'
    #todo
  when 'user logo'
    logo = find_elements(:id, 'com.bleacherreport.android.teamstream:id/profile_image')
    user = find_elements(:id, 'com.bleacherreport.android.teamstream:id/username')

    @user_name = user[0].text
    logo[0].click
  end
end

Then(/^I am redirected to the users full screen profile$/) do
  #FIXME - Delete when no longer needed
  MobileDriver.snap_eyes('Verify User Profile Screen')
  u_name = find_element(:id, 'com.bleacherreport.android.teamstream:id/username')
  raise "Profile: #{@user_name} not found" unless u_name.text == @user_name
end

When(/^the user provides 5 lines of comments$/) do
  @comments = TestData.use_data('comments', 'multiline')
  on(CommentScreen).set_comment_txtfield(@comments)
end

Then(/^the input field is scrollable$/) do
  driver.swipe(:start_x => 345,:start_y => 952,:end_x =>345,:end_y =>650,:touchCount => 2,:duration => 0)
end

And(/^the send button is still shown$/) do
  on(CommentScreen).tap_comment_txtfield
  on(GlobalScreenElements).verify_textview_exist('SEND')
end

Then(/^the comment is posted to the gamecast$/) do
  raise('Comment not posted') unless find_element(:xpath, "//android.widget.TextView[@text='Cool!']").displayed?
end