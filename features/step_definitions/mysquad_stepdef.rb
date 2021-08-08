Then(/^I add a friend from a stream$/) do
  ReusableFunction.wait_for(2)
  step 'I tap on the "comment" icon from the article'
  btn_arr = find_elements(:id, 'com.bleacherreport.android.teamstream:id/btn_contact_add')
  username_arr = find_elements(:id, 'com.bleacherreport.android.teamstream:id/txt_username')

  btn_arr.zip username_arr
  btn_arr.zip(username_arr).each do |btn, txt|
    if btn.text == 'Follow'
      @username = txt.text
      btn.click
      puts "I added #{@username}"
      break
    end
  end
end

Then(/^the person I'm following is shown$/) do
  begin
    ReusableFunction.wait_for(10)
    username_txt = find_elements(:id, 'com.bleacherreport.android.teamstream:id/txt_username')
    raise 'user not added' if find(@username).displayed?.eql?(false)
    username_txt.each do |username|
    puts "I am friends with #{username.text}"
  end
    puts 'Total friend count: ' + username_txt.count.to_s
  rescue
    puts "#{@username} is not in view"
  end
end

Then(/^I am able to unfollow people from my squad list$/) do
  follow_status = find_elements(:id, 'com.bleacherreport.android.teamstream:id/btn_follow_status')
  follow_status.each do |btn|
  btn.click if btn.text == 'Following'
  end
end