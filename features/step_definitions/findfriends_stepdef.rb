And(/^the find friends "(.*?)" tab is shown$/) do |tab|
  on(GlobalScreenElements).close_txt_prompt_banner_exists
  on(GlobalScreenElements).tap_textview(tab)
  ReusableFunction.wait_for(5)

  case tab
  when 'Suggested'
    begin
      find_element(:xpath, "//androidx.appcompat.app.ActionBar$Tab[@content-desc='Suggested']").displayed?
      MobileDriver.snap_eyes('Verify Suggested Friends')
    rescue
      puts 'There are no followers to suggest'
      MobileDriver.snap_eyes('Verify No Suggested Friends')
    end
  when 'Contacts','Facebook'
    begin
      id('com.bleacherreport.android.teamstream:id/followAllText').displayed?
      MobileDriver.snap_eyes("Verify  #{tab} Friends")
    rescue
      on(GlobalScreenElements).verify_btn_exist("Connect #{tab}")
      MobileDriver.snap_eyes("Verify No #{tab} Friends")
    end
  end
end

When(/^I tap on the Find Friends icon from toolbar menu$/) do
  #Below element is local to find friends screen
  find_element(:id, "com.bleacherreport.android.teamstream:id/menu_find_friends").click
end