  And(/^I decide to "(.*?)" from (comments|profile)$/) do |status,screen|
  ReusableFunction.hide_keyboard_option
  ReusableFunction.wait_for(2)

  @option_check = on(CommentScreen).verify_comment_option

  if @option_check
    puts 'No User to Block'
  else
    on(CommentScreen).tap_comment_option
    ReusableFunction.wait_for(2)
    case status
    when 'Block User'
      begin
        find('Block User').click
      rescue
        find('Unblock User').click
        on(CommentScreen).tap_comment_option
        find('Block User').click
      end

    when 'Unblock User'
      begin
        find('Unblock User').click
      rescue
        find('Block User').click
        on(SettingsScreen).tap_settings_ok_btn
        on(SettingsScreen).tap_settings_ok_btn
        ReusableFunction.wait_for(3)
        on(CommentScreen).tap_comment_option
        find('Unblock User').click
      end
    end
  end
end

Then(/^a confirmation dialogue that a user is "(.*?)" is (shown|not shown)$/) do |status, type|
  if @option_check
    puts 'No User to block'
  else
    case status
    when 'blocked'
      if on(GlobalScreenElements).verify_popup_alert_title
        MobileDriver.snap_eyes('Verify Mute Pop-Up Alert')
        on(SettingsScreen).tap_settings_ok_btn
      end
      if on(GlobalScreenElements).verify_popup_alert_title
        MobileDriver.snap_eyes('Verify User Muted Alert')
        on(SettingsScreen).tap_settings_ok_btn
      end
    when 'unblocked'
      MobileDriver.snap_eyes('Verify User Unmuted Screen')
    end
  end
end

Then(/^a confirmation banner that a user is "(.*?)" is (shown|not shown)$/) do |status, type|
  if @option_check
    puts 'No User to block'
  else
    case status
    when 'blocked'
      if on(GlobalScreenElements).verify_popup_alert_title
        MobileDriver.snap_eyes('Verify Mute Pop-Up Alert')
        on(SettingsScreen).tap_settings_ok_btn
        on(SettingsScreen).tap_settings_ok_btn
      end
      if on(MyProfileScreen).verify_profile_muted_banner
        MobileDriver.snap_eyes('Verify Muted Profile')
      end
    when 'unblocked'
      MobileDriver.snap_eyes('Verify User Profile Screen')
    end
  end
end