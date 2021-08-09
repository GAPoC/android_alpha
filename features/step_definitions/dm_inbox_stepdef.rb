And(/^I send a test message into the chat$/) do
  @chat = "Android Test Message: " + Time.now.to_i.to_s
  on(DMInboxScreen).set_send_msg_txtfield(@chat)
  on(DMInboxScreen).tap_send_message_btn
end

Then(/^I verify I received a chat message$/) do
  sleep 5
  on(GlobalScreenElements).verify_textview_exist(@chat)
end

When(/^I search for my friend "(.*?)"$/) do |search|
  on(DMInboxScreen).set_search_for_friends_txtfield(search)
  sleep 5
end

And(/^I tap the "(.*?)" button from DM$/) do |btn|
  ReusableFunction.wait_for(3)
  case btn
  when 'send message'
    on(DMInboxScreen).tap_send_first_msg_btn
  when 'chat details'
    on(DMInboxScreen).tap_chat_details_btn
  when 'add member'
    on(DMInboxScreen).tap_add_member_btn
  end

end

And(/^I tap on the new chat button$/) do
  on(DMInboxScreen).tap_new_chat_btn
end

And(/^I change the chat name to "(.*?)"$/) do |text|
  on(DMInboxScreen).set_edit_chat_name_txtfield(text)
end

And(/^I tap on DM GIF button$/) do
  on(DMInboxScreen).tap_dm_gif_btn
end

Then(/^I verify that a GIF is sent$/) do
  raise('GIF not sent') unless find_element(:id, "com.bleacherreport.android.teamstream:id/gif_still").displayed?
end