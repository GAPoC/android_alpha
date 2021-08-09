And(/^I sort to the "(.*?)" posts via sort "(.*?)"$/) do |sort_type, sort_button|
  case sort_button
  when 'button'
    on(CommunityScreen).tap_sort_btn
  when 'label'
    title = on(CommunityScreen).get_sort_order_label
    on(GlobalScreenElements).tap_textview(title)
  when 'caret'
    on(CommunityScreen).tap_sort_caret
  end
  on(CommunityScreen).tap_sort_alert_option(sort_type)
end