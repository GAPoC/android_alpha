Then(/^I tap on the "([^"]*)" link from the context label$/) do |arg|
  #TODO pending code
end

And(/^I tap on username from Context label$/) do
  #TODO pending code
end

And(/^I verify the Comment button is not displayed$/) do
  raise('Able to locate comment button') unless on(ArticleScreen).verify_conversation_btn == false
end