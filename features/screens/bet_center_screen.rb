require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Bet Center Screen
# element functionalities
class BetCenterScreen
  include Accessors
  extend ObjectRepo

  # TEXT Element
  Accessors.text(:gamecast_link, ObjectRepo::BET_GAMECAST_LINK)
  def tap_bet_gamecast_link
    gamecast_link
  end

  def verify_bet_gamecast_link_exist
    gamecast_link?
  end

  Accessors.text(:recent_pack_state, ObjectRepo::RECENT_PACK_STATE)
  def tap_recent_pack_state
    recent_pack_state
  end

  Accessors.text(:no_packs_txt, ObjectRepo::NO_PACKS_TXT)
  def verify_no_packs_txt_exists
    no_packs_txt?
  end

  Accessors.text(:community_name_txt, ObjectRepo::COMMUNITY_NAME_TXT)
  def tap_community_name
    community_name_txt
  end

  Accessors.text(:pack_state_txt, ObjectRepo::PACK_STATE_TXT)
  def verify_pack_state_txt_exists
    pack_state_txt?
  end

  def pack_state_text
    pack_state_txt_text
  end

  # BUTTON Element
  Accessors.button(:howt_play_btn, ObjectRepo::HOW_TO_PLAY_BTN)
  def tap_howt_play_btn
    howt_play_btn
  end

  Accessors.button(:pick_answer_btn, ObjectRepo::PICK_ANSWER_BTN)
  def tap_pick_answer_btn
    pick_answer_btn
  end

  def verify_pick_answer_btn
    pick_answer_btn?
  end

  Accessors.button(:toolbarUp_btn, ObjectRepo::TOOLBAR_UP_BTN)
  def tap_toolbarUp_btn
    toolbarUp_btn
  end

  Accessors.button(:join_team_btn, ObjectRepo::JOIN_TEAM_BTN)
  def tap_join_team_btn
    join_team_btn
  end

  Accessors.button(:past_results_btn, ObjectRepo::BET_PAST_RESULTS_BTN)
  def verify_past_results_btn
    past_results_btn?
  end

  Accessors.button(:bet_team1_btn, ObjectRepo::BET_TRACK_TEAM1)
  def tap_bet_team1_btn
    bet_team1_btn
  end

  def verify_bet_team1_btn
    bet_team1_btn?
  end

  Accessors.button(:bet_team2_btn, ObjectRepo::BET_TRACK_TEAM2)
  def tap_bet_team2_btn
    bet_team2_btn
  end

  def verify_bet_team2_btn
    bet_team2_btn?
  end

  # IMAGE element
  Accessors.image(:betting_logo_img, ObjectRepo::BETTING_LOGO)
  def verify_betting_logo
    betting_logo_img?
  end

  Accessors.image(:bet_info_img, ObjectRepo::BET_TRACK_INFO)
  def tap_bet_info
    bet_info_img
  end

  #ELEMENTS
  Accessors.element(:bet_track_img, ObjectRepo::BET_TRACK_HOLDER)
  def verify_bet_track
    begin
      bet_track_img.element.displayed?
    rescue StandardError
      false
    end
  end
end