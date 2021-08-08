#Temporary Experiments powered by LeanPlum

Then(/^Dismiss "(.*?)" alert by clicking "(.*?)"$/) do |type,btn|
  on(GlobalScreenElements).interact_pop_up_alerts("#{type}","#{btn}")
end

#Social Promo Experiments
Then('the {string} social promo is {string}') do |promo, status|
  case status
  when 'shown'
    ReusableFunction.wait_for(7)
    if exists{find_element(:xpath, "//android.view.View[@text='#{promo}']")}
      step 'I navigate back using device back button'
    elsif exists{find_element(:id, "com.bleacherreport.android.teamstream:id/container_view")} #due to ANDROID -2359
      step 'I navigate back using device back button'
    else
      puts 'No Social Promo Shown'
    end
    ReusableFunction.wait_for(7)
  end
end

# And(/^the Find out who you know on BR social promo is shown$/) do
#   sleep 3
#   if exists{find_element(:xpath, "//android.view.View[@text='Find Out Who You Know on B/R']")}
#     Appium::TouchAction.new.tap(x: 500, y: 150, count: 1).perform
#   end
# end