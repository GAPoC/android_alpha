require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Sign Up Screen
# element functionalities
class SignUpScreen
  include Accessors
  extend ObjectRepo

  # Methods for fb and email signup link)
  Accessors.text(:fb_email_link, ObjectRepo::FB_EMAIL_SIGNUP_LINK)

  def tap_fb_email_link
    fb_email_link
  end

  # Methods for FB and Email sign up button
  Accessors.button(:email_signup_btn, ObjectRepo::EMAIL_SIGNUP_BTN)

  def tap_email_signup_btn
    email_signup_btn
  end

  Accessors.button(:maybe_later_btn, ObjectRepo::MAYBE_LATER_BTN)

  def tap_maybe_later_btn
    maybe_later_btn
  end

  Accessors.button(:stepper_continue_btn, ObjectRepo::STEPPER_CONTINUE_BTN)

  def tap_stepper_continue_btn
    stepper_continue_btn
  end
end