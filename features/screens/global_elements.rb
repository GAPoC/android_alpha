require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Global Screen
# element functionalities
# FIXME: Class/Module has too many methods
class GlobalScreenElements
  include Accessors
  extend ObjectRepo

  # ------- Methods for reusable button elements -------

  Accessors.button(:continue_btn, ObjectRepo::CONTINUE_BTN)
  def tap_continue_btn
    continue_btn
  end

  Accessors.button(:done_btn, ObjectRepo::DONE_BTN)
  def tap_done_btn
    ReusableFunction.wait_for(3)
    done_btn
  end

  def check_done_btn_enabled?
    done_btn_enabled?
  end

  Accessors.button(:skip_btn, ObjectRepo::ACTION_SKIP_BTN)
  def tap_skip_btn
    skip_btn
  end

  Accessors.button(:action_done_btn, ObjectRepo::ACTION_DONE_BTN)
  def tap_action_done_btn
    action_done_btn
  end

  def check_action_done_btn_enabled
    action_done_btn_enabled?
  end

  Accessors.button(:action_next_btn, ObjectRepo::ACTION_NEXT_BTN)
  def tap_action_next_btn
    action_next_btn
  end

  Accessors.button(:save_btn, ObjectRepo::SAVE_BTN)
  def tap_save_btn
    save_btn
  end

  Accessors.button(:navigate_up_btn, ObjectRepo::NAVIGATE_UP_BTN)
  def verify_navigate_up_btn_exist
    navigate_up_btn?
  end

  def tap_navigate_up_btn
    navigate_up_btn
  end

  Accessors.button(:close_tab_btn, ObjectRepo::CLOSE_TAB_BTN)
  def verify_close_tab_btn_exist
    close_tab_btn?
  end

  def tap_close_tab_btn
    close_tab_btn
  end

  def tap_general_button(btn)
    find_element(:xpath, "//android.widget.Button[@text='#{btn}']").click
  end

  def verify_btn_exist(btn)
    find_element(:xpath, "//android.widget.Button[@text='#{btn}']").displayed?
  end

  def verify_btn_disabled(btn)
    button_state = find_element(:xpath, "//android.widget.Button[@text='#{btn}']").enabled?
    raise('Expected to be disabled') if button_state != false
  end

  # ------- Methods for reusable text elements -------

  Accessors.text(:text_status, ObjectRepo::TXT_STATUS)
  def get_text_status
    text_status_text
  end

  Accessors.text(:toast_msg, ObjectRepo::TXT_SHADE)
  def get_toast_msg
    toast_msg_text
  end

  Accessors.text(:toolbar_title, ObjectRepo::TOOLBAR_TITLE)
  def verify_toolbar_title(text)
    ReusableFunction.wait_for(3)
    unless get_toolbar_title.include?(text)
      raise("Unable to locate #{text} header")
    end
  end

  def verify_toolbar_title_exist?
    toolbar_title?
  end

  def get_toolbar_title
    toolbar_title_text
  end

  Accessors.text(:text_summary, ObjectRepo::TXT_SUMMARY)
  def verify_text_summary(text)
    ReusableFunction.wait_for(3)
    unless get_text_summary.include?(text)
      raise("Unable to locate #{text} element")
    end
  end

  def get_text_summary
    text_summary_text
  end

  Accessors.text(:snackbar_txt, ObjectRepo::SNACKBAR_TXT)
  def get_snackbar_txt
    snackbar_txt_text
  end

  def tap_snackbar_txt
    snackbar_txt
  end

  def verify_textview_exist(text)
    find_element(:xpath, "//android.widget.TextView[@text='#{text}']").displayed?
  end

  # method not failing if textview is not exists - this is temporarily solution
  def verify_textview_exist_tf(text)
    find_element(:xpath, "//android.widget.TextView[@text='#{text}']").displayed?
  rescue StandardError
    false
  end

  def verify_textview_contains_exist(text)
    find_element(:xpath, "//android.widget.TextView[contains(@text, '#{text}')]").displayed?
  rescue StandardError
    false
  end

  def tap_textview(text)
    begin
      ele = find_element(:xpath, "//android.widget.TextView[@text='#{text}']")
    rescue StandardError
      ele = find_element(:xpath, "//android.widget.TextView[@content-desc='#{text}']")
    end
    ele.click
    ReusableFunction.wait_for(5)
  end

  Accessors.text(:general_text, ObjectRepo::GENERAL_TEXT)
  def get_general_text
    general_text_text
  end

  def tap_general_text
    general_text
  end

  Accessors.text(:username_txt, ObjectRepo::USERNAME_TXT)
  def get_username_txt
    username_txt_text
  end

  def tap_username_txt
    username_txt
  end

  Accessors.text(:fullname_txt, ObjectRepo::FULL_NAME_TXT)
  def get_fullname_txt
    fullname_txt_text
  end

  Accessors.text(:text_title, ObjectRepo::TEXT_TITLE)
  def get_text_title
    text_title_text
  end

  Accessors.text(:headline_view, ObjectRepo::HEADLINE_TXTVIEW)
  def verify_headline_view_exist
    headline_view?
  end

  Accessors.text(:top_news_headline, ObjectRepo::TOP_NEWS_HEADLINES)
  def verify_top_news_headline
    begin
      top_news_headline?
    rescue StandardError
    end
  end

  Accessors.text(:txt_prompt_banner, ObjectRepo::TXT_PROMPT_BANNER)
  def close_txt_prompt_banner_exists
    sleep 3
    begin
      close = id('com.bleacherreport.android.teamstream:id/btn_clear').click
      close if txt_prompt_banner?
    rescue StandardError
      puts 'Text Prompt Banner not displayed'
    end
    sleep 3
  end

  Accessors.text(:gamecast_comments_textview, ObjectRepo::GAMECAST_COMMENTS)
  def verify_gamecast_comments_textview_exist
    gamecast_comments_textview?
  end

  def tap_gamecast_comments_textview
    gamecast_comments_textview
  end

  # ------- Methods for reusable textfield elements -------

  Accessors.text_field(:username_txtfield, ObjectRepo::USERNAME_TXTFIELD)
  def set_username_txtfield(username)
    self.username_txtfield = username
  end

  def clear_username_txtfield
    clear_username_txtfield
  end

  Accessors.text_field(:fname_txtfield, ObjectRepo::FIRSTNAME_TXTFIELD)
  def set_fname_txtfield(first_name)
    self.fname_txtfield = first_name
  end

  Accessors.text_field(:lname_txtfield, ObjectRepo::LASTNAME_TXTFIELD)
  def set_lname_txtfield(last_name)
    self.lname_txtfield = last_name
  end

  # ------- Methods for keyboard elements -------

  def close_keyboard
    hide_keyboard
  end

  # ------- Methods for alerts elements -------

  Accessors.text(:deny_permission, ObjectRepo::ALERT_DENY_BTN)
  def tap_deny_permission
    deny_permission
  end

  Accessors.text(:allow_permission, ObjectRepo::ALERT_ALLOW_BTN)
  def tap_allow_permission
    allow_permission
  end

  # Pop-up alert text
  Accessors.text(:popup_alert_title, ObjectRepo::POPUP_ALERT_TITLE)
  def verify_popup_alert_title
    popup_alert_title?
  end

  #----PAGE NAVIGATION----

  def interact_pop_up_alerts(alert_title, alert_btn)
    global_ele = GlobalScreenElements.new
    global_ele.verify_textview_exist(alert_title) ? global_ele.tap_general_button(alert_btn) : puts('No Alerts')
  rescue StandardError
    puts "Alert Title: #{alert_title} accepted"
  end
end