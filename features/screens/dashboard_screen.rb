require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Dashboard Screen
# element functionalities
# FIXME: Class has too many lines
class DashboardScreen
  include Accessors
  extend ObjectRepo

  # Accessors.buttonS METHOD
  Accessors.button(:home_btn, ObjectRepo::HOME_BTN)
  def verify_home_btn_exist
    ReusableFunction.wait_for(3, 'Home Accessors.button') { home_btn? }
  end

  def tap_home_btn
    home_btn
  end

  Accessors.button(:fire_btn, ObjectRepo::FIRE_BTN)
  def tap_fire_btn
    fire_btn
  end

  Accessors.button(:alert_btn_fire, ObjectRepo::ALERT_BTN_FIRE)
  def tap_alert_btn_fire
    alert_btn_fire
  end

  Accessors.button(:my_br_btn, ObjectRepo::MY_BR_BTN)
  def tap_my_br_btn
    my_br_btn
  end

  Accessors.button(:alerts_btn, ObjectRepo::ALERTS_BTN)
  def tap_alerts_btn
    alerts_btn
  end

  Accessors.button(:alert_article_message_btn, ObjectRepo::ALERT_ARTICLE_MESSAGE)
  def tap_alert_article_message_btn
    alert_article_message_btn
  end

  Accessors.button(:scores_btn, ObjectRepo::SCORES_BTN)
  def tap_scores_btn
    scores_btn
  end

  Accessors.button(:search_btn, ObjectRepo::SEARCH_BTN)
  def tap_search_btn
    search_btn
  end

  Accessors.button(:profile_btn, ObjectRepo::PROFILE_BTN)
  def tap_profile_btn
    profile_btn
  end

  Accessors.button(:settings_btn, ObjectRepo::MENU_SETTINGS_BTN)
  def tap_settings_btn(btn = nil)
    case btn
    when 'More Options'
      begin
        sleep 2
        settings_btn
      rescue StandardError
        find_element(:xpath, "//android.widget.ImageView[@content-desc='More options']").click
        find_element(:xpath, "//android.widget.TextView[@text='Settings']").click
      end
    end
  end

  Accessors.button(:send_feedback_btn, ObjectRepo::FEEDBACK_BTN)
  def tap_send_feedback_btn
    send_feedback_btn
  end

  Accessors.button(:dm_inbox_btn, ObjectRepo::DM_INBOX_BTN)
  def tap_dm_inbox_btn
    dm_inbox_btn
  end

  # textFIELD METHODS
  Accessors.text_field(:menu_search_txtfield, ObjectRepo::MENU_SEARCH_TXTFIELD)
  def set_menu_search_txtfield(txt)
    self.menu_search_txtfield = txt
    ReusableFunction.wait_for(7)
  end

  def clear_menu_search_txtfield
    clear_menu_search_txtfield
  end

  # Accessors.text METHODS
  Accessors.text(:display_name_txt, ObjectRepo::DISPLAY_NAME_TXT)
  def tap_display_name_txt
    display_name_txt
  end

  def verify_display_name_txt_exists
    display_name_txt?
  end

  Accessors.text(:find_friends, ObjectRepo::FIND_FRIENDS_BTN)
  def tap_find_friends_btn
    find_friends
  end

  def verify_find_friends_exists
    find_friends?
  end

  Accessors.text(:find_friends_search_btn, ObjectRepo::FIND_FRIENDS_SEARCH)
  def tap_find_friends_search_btn
    find_friends_search_btn
  end

  # ---- PAGE NAVIGATION METHOD ----

  def nav_to_home_screen
    # Steps in page navigation does not sign in user

    # Variables
    welcome_screen = WelcomeScreen.new
    global_elem = GlobalScreenElements.new
    signup_screen = SignUpScreen.new
    choose_your_team = ChooseYourTeamScreen.new
    player = TestData.use_data('test_stream', 'dodgeball')

    # Steps
    welcome_screen.tap_pick_teams_btn
    choose_your_team.pick_teams_via_search_flow(player)
    global_elem.tap_done_btn
    # FIXME: Conditional to assert notification screen
    sleep 5
    begin
      signup_screen.tap_maybe_later_btn unless global_elem.get_toolbar_title == 'Notifications'
      global_elem.tap_done_btn if global_elem.verify_textview_exist('Notifications')
    rescue StandardError
      puts 'Notification Screen Not Shown'
    end
    sleep 10
  end
end