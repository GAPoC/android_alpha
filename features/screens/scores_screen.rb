require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Scores Screen
# element functionalities
# FIXME: Class has too many goals
class ScoresScreen
  include Accessors
  extend ObjectRepo

  # TEXT Element
  Accessors.text(:team_name_txt, ObjectRepo::SCORES_TEAM_NAME)
  def get_team_name_txt
    team_name_txt_text
  end

  Accessors.text(:scores_league_txt, ObjectRepo::SCORES_LEAGUE_BTN)
  def tap_scores_league_txt
    scores_league_txt
  end

  Accessors.text(:scores_previous_date, ObjectRepo::SCORES_PREVIOUS_DATE)
  def tap_scores_previous_date
    scores_previous_date
  end

  Accessors.text(:scores_future_date, ObjectRepo::SCORES_FUTURE_DATE)
  def tap_scores_future_date
    scores_future_date
  end

  def verify_scores_future_date
    scores_future_date?
  end

  Accessors.text(:scores_no_game, ObjectRepo::SCORE_NO_GAMES)
  def verify_scores_no_game
    scores_no_game?
  end

  Accessors.text(:seeall_standing_link, ObjectRepo::SCORES_STANDING_SEEALL_LINK)
  def verify_seeall_standing_link_exist
    seeall_standing_link?
  end

  def get_seeall_standing_link_txt
    seeall_standing_link_text
  end

  Accessors.text(:scores_carousel, ObjectRepo::SCORES_CAROUSEL)
  def verify_scores_carousel_exists
    scores_carousel?
  end

  Accessors.text(:scores_carousel_label, ObjectRepo::SCORES_CAROUSEL_LABEL)
  def verify_scores_carousel_label
    scores_carousel_label?
  end

  Accessors.text(:scores_calendar, ObjectRepo::SCORES_CURRENT_DATE)
  def tap_on_scores_current_date
    scores_calendar
  end

  Accessors.text(:team_1_txt, ObjectRepo::TEAM_1_NAME)
  def tap_team_1
    team_1_txt
  end

  Accessors.text(:team_2_txt, ObjectRepo::TEAM_2_NAME)
  def tap_team_2
    team_2_txt
  end

  Accessors.text(:odds_label_txt, ObjectRepo::ODDS_LABEL_TXT)
  def verify_odds_label_txt_exists
    odds_label_txt?
  end

  Accessors.text(:golf_team_name, ObjectRepo:: GOLF_TEAM_NAME)
  def tap_golf_team_name
    golf_team_name
  end

  def verify_golf_team_name?
    golf_team_name?
  end

  Accessors.button(:partner_btn, ObjectRepo::PARTNER_BTN)
  def verify_partner_btn_exists
    partner_btn?
  end

  Accessors.button(:full_recap_and_highlights, ObjectRepo::FULL_RECAP_AND_HIGHLIGHTS)
  def tap_full_recap_and_highlights
    full_recap_and_highlights
  end

  # ------ SCORES CALENDAR Element ------
  Accessors.text(:calendar_month_txt, ObjectRepo::CALENDAR_MONTH_NAME)
  def get_calendar_month_txt
    calendar_month_txt_text
  end

  Accessors.element(:previous_caret_btn, ObjectRepo::PREVIOUS_CARET_BTN)
  Accessors.element(:next_caret_btn, ObjectRepo::NEXT_CARET_BTN)
  def tap_on_calendar_previous_btn
    previous_caret_btn.element.click
  end

  def tap_on_calendar_nxt_btn
    next_caret_btn.element.click
  end

  def check_prev_caret_attr
    previous_caret_btn.element.attribute('enabled')
  end

  def check_next_btn_attr
    next_caret_btn.element.attribute('enabled')
  end

  # ------ SELECT A DATE FUNCTION ------
  # This calendar function is meant to select a random day from previous or next calendar month
  # FIXME: Method condition is too high
  # FIXME: Method has too many lines
  def select_a_scores_date(calendar_status = nil)
    get_calendar_month_txt

    case calendar_status.downcase
    when 'previous'
      prev_month = Time.new.to_datetime.prev_month.strftime('%B %Y').to_s
      tap_on_calendar_previous_btn until get_calendar_month_txt.eql?(prev_month)
    when 'future'
      next_month = Time.new.to_datetime.next_month.strftime('%B %Y').to_s
      tap_on_calendar_nxt_btn until get_calendar_month_txt.eql?(next_month)
    end
    ReusableFunction.wait_for(3)
    find_element(:xpath, "//android.widget.CheckedTextView[@text='#{rand(1..28)}']").click
  end

  # ------ Betting link ------
  Accessors.text(:betting_link, ObjectRepo::BETTING_LINK)
  def tap_betting_link
    betting_link
  end

  def verify_betting_link_exist
    betting_link?
  end

  # ------ Disclaimer link ------
  # Accessors.text(:disclaimer_text, ObjectRepo:: DISCLAIMER_TEXT)
  def verify_disclaimer_text_exists
    exists { find_element(:id, 'com.bleacherreport.android.teamstream:id/disclaimer') }
  end

  def verify_nba_wnba_disclaimer_text_exists
    exists { find_element(:id, 'com.bleacherreport.android.teamstream:id/bettingDisclaimer') }
  end
end