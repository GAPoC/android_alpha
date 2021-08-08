require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Settings Screen
# element functionalities
class SettingsScreen
  include Accessors
  extend ObjectRepo

  # Button Element
  Accessors.text(:settings_sign_in_btn, ObjectRepo::SETTINGS_SIGN_IN_BTN)

  def tap_settings_sign_in_btn
    settings_sign_in_btn
  end

  Accessors.text(:settings_create_account_btn, ObjectRepo::SETTINGS_SIGN_IN_BTN)

  def tap_settings_create_account_btn
    settings_create_account_btn
  end

  Accessors.text(:my_profile_btn, ObjectRepo::MY_PROFILE_BTN)

  def tap_my_profile_btn
    my_profile_btn
  end

  Accessors.text(:home_settings_btn, ObjectRepo::DETAILS_LINK_TXT)

  # TODO: Pending Code - Please delete if no longer in use

  Accessors.text(:video_autoplay_btn, ObjectRepo::VIDEO_AUTOPLAY_BTN)

  def tap_video_autoplay_btn
    video_autoplay_btn
  end

  Accessors.text(:my_teams_only_btn, ObjectRepo::MY_TEAMS_ONLY_BTN)

  def tap_my_teams_only_btn
    my_teams_only_btn
  end

  Accessors.text(:top_news_my_teams_btn, ObjectRepo::TOP_NEWS_MY_TEAMS_BTN)

  def tap_top_news_my_teams_btn
    top_news_my_teams_btn
  end

  Accessors.text(:settings_ok_btn, ObjectRepo::OK_BTN)

  def tap_settings_ok_btn
    settings_ok_btn
  end

  Accessors.text(:wifi_cellular_btn, ObjectRepo::WIFI_CELLULAR_BTN)

  def tap_wifi_cellular_btn
    wifi_cellular_btn
  end

  Accessors.text(:never_autoplay_btn, ObjectRepo::NEVER_AUTOPLAY_BTN)

  def tap_never_autoplay_btn
    never_autoplay_btn
  end

  Accessors.text(:app_build_version_txt, ObjectRepo::APP_BUILD_VERSION)

  def get_app_build_version_txt
    app_build_version_txt_text
  end

  def verify_app_build_version_txt
    unless app_build_version_txt? && get_app_build_version_txt.start_with?('8.')
      raise 'Version number missing'
    end

    puts get_app_build_version_txt
  end

  Accessors.button(:setting_sign_out, ObjectRepo::SETTINGS_BTN)

  def tap_setting_btn(btn)
    find_element(:xpath, "//android.widget.Button[@text='#{btn}']").click
  end

  def verify_settings_btn(btn)
    find_element(:xpath, "//android.widget.Button[@text='#{btn}']").displayed?
  end

  # FIXME: Method has too many lines
  def sign_out_flow
    settings_screen = SettingsScreen.new
    global_screen = GlobalScreenElements.new
    experiment_screen = Experiments.new

    sleep 5

    begin
      find_element(:xpath, '//android.view.View[@text="Find Out Who You Know on B/R"]')
      experiment_screen.tap_close_modal_btn
    rescue StandardError
      puts 'No Social Promo Shown'
    end

    sleep 5

    begin
      ReusableFunction.scroll_to('Sign Out')
    rescue StandardError
      6.times { ReusableFunction.scroll_up }
    end

    settings_screen.tap_setting_btn('Sign Out')
    global_screen.interact_pop_up_alerts('Confirm Sign Out', 'SIGN OUT')
    sleep 2
  end
end