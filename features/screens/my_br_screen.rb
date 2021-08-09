require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define My BR Screen
# element functionalities
class MyBRScreen
  include Accessors
  extend ObjectRepo

  # BUTTON Elements

  Accessors.button(:add_team_btn, ObjectRepo::ADD_TEAMS_BTN)
  def tap_add_team_btn
    add_team_btn
  end

  Accessors.button(:menu_edit_btn, ObjectRepo::MENU_EDIT_BTN)
  def tap_menu_edit_btn
    menu_edit_btn
  end

  Accessors.button(:delete_team, ObjectRepo::MENU_EDIT_BTN)
  def delete_all_my_teams
    close = find_elements(:id, 'com.bleacherreport.android.teamstream:id/edit_button')
    close.each do
      delete_team
    end
  end

  Accessors.button(:mybr_edit_profile, ObjectRepo::MYBR_EDIT_PROFILE)
  def tap_mybr_edit_profile_btn
    mybr_edit_profile
  end

  # TEXT Elements
  Accessors.text(:team_name_label, ObjectRepo::NAME_LABEL_TXT)
  def get_team_name_label
    team_name_label_text
  end

  # IMAGE Elements
  Accessors.image(:mybr_profile_photo, ObjectRepo::MYBR_PROFILE_PHOTO)
  def tap_mybr_profile_photo_active
    mybr_profile_photo
  end

  Accessors.image(:mybr_photo_btn_inactive, ObjectRepo::MYBR_ADD_PHOTO_INACTIVE)
  def tap_mybr_photo_btn_inactive
    mybr_photo_btn_inactive
  end

  # ---- PAGE NAVIGATION - ADD TEAM ----

  def add_a_team(team)
    team_screen = MyBRScreen.new
    choose_team_screen = ChooseYourTeamScreen.new
    global_element = GlobalScreenElements.new

    team_screen.tap_add_team_btn
    choose_team_screen.set_search_txtfield(team)
    ele = find_element(:xpath, "//android.widget.TextView[@text='#{team}']")
    ele.click
    global_element.tap_done_btn
  end

  def remove_specific_team(team)
    find_element(:xpath, "//android.widget.FrameLayout[@content-desc='#{team} delete']").click
  end
end