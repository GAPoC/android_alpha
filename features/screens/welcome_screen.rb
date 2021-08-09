require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Welcome Screen
# element functionalities
class WelcomeScreen
  include Accessors
  extend ObjectRepo

  # Methods for pick teams button elements
  Accessors.text(:pick_teams_btn, ObjectRepo::PICK_TEAMS_BTN)

  def verify_pick_teams_btn_exist
    pick_teams_btn?
  end

  def tap_pick_teams_btn
    pick_teams_btn
  end

  # Methods for sign in button elements
  Accessors.text(:sign_in_btn, ObjectRepo::SIGN_IN_BTN)

  def tap_sign_in_btn
    sign_in_btn
  end

  # Methods for sign out button
  Accessors.text(:sign_out_btn, ObjectRepo::SIGN_OUT_BTN)

  def tap_sign_out_btn
    sign_out_btn
  end

  def verify_sign_out_btn_exist
    sign_out_btn?
  end

  def verify_eu_us_welcome_screen
    # Tests EU / US Welcome Screen UI
    locale = %w[GB AU BE]

    if locale.include? ENV['LOCALE'].to_s
      MobileDriver.snap_eyes("Verify #{locale} Locale - Welcome Screen")
    else
      MobileDriver.snap_eyes('Verify US Welcome Screen')
    end
  end
end