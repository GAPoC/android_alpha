
Then(/^the textview Gamecast comments displayed$/) do
  ReusableFunction.wait_for(3)
  on(GlobalScreenElements).verify_gamecast_comments_textview_exist
end

And(/^I tap on Gamecast comments textview$/) do
  ReusableFunction.wait_for(3)
  on(GlobalScreenElements).tap_gamecast_comments_textview
end

Then(/^I tap on the "([^"]*)" button on pop up$/) do |button_name|
  ReusableFunction.wait_for(3)
  case button_name
  when 'Create Username'
    on(CommentaryFmGamecast).tap_create_usrname_btn
  when 'Sign In'
    on(CommentaryFmGamecast).tap_sign_in_btn_gc
  end
end

And(/^I tap on the Sort Comments button$/) do
  on(CommentaryFmGamecast).tap_comment_sort_btn
  ReusableFunction.wait_for(3)
end

And(/^I verify that my comment on top of the Commens list$/) do
  raise("Comment not posted") unless find_element(:xpath, "//android.widget.TextView[@text='Cool!']").displayed?
end

Then(/^I tap on the fire comment button$/) do
  on(CommentaryFmGamecast).fire_comment_btn
end

And(/^I tap on the Menu Sort button$/) do
  on(CommentScreen).tap_sort_btn
end

Then(/^I tap on Reply to comment textview$/) do
  on(CommentaryFmGamecast).tap_comment_reply_btn
end

Then(/^I tap on Profile icon for comment$/) do
  on(CommentaryFmGamecast).tap_profile_comments_icon
end

And(/^I verify that POSTPONED status for game exist$/) do
  on(GlobalScreenElements).verify_textview_exist("POSTPONED")
  puts "No completed games due to POSTPONED status"
end