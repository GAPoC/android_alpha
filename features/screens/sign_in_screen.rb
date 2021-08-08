require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Sign In Screen
# element functionalities
# FIXME: Class has too many lines
class SignInScreen
  include Accessors
  extend ObjectRepo

  Accessors.text(:sign_up_btn, ObjectRepo::SIGN_UP_BTN)

  def tap_sign_up_btn
    sign_up_btn
  end

  Accessors.text(:sign_in_email_btn, ObjectRepo::SIGN_IN_EMAIL_BTN)

  def tap_sign_in_email_btn
    sign_in_email_btn
  end

  Accessors.text(:signin_email_phone_btn, ObjectRepo::SIGNIN_PHONE_EMAIL_BTN)

  def tap_signin_email_phone_btn
    signin_email_phone_btn
    hide_keyboard
    sleep 3
  end

  Accessors.text(:sign_in_fb_btn, ObjectRepo::SIGN_IN_FB_BTN)

  def tap_sign_in_fb_btn
    sign_in_fb_btn
  end

  Accessors.text(:sign_in_google, ObjectRepo::SIGN_IN_GOOGLE_BTN)

  def tap_sign_in_google_btn
    sign_in_google
  end

  Accessors.text(:connect_friends_skip_btn, ObjectRepo::CONNECT_FRIENDS_SKIP_BTN)

  def tap_connect_friends_skip_btn
    connect_friends_skip_btn
  end

  Accessors.text_field(:email_txtfield, ObjectRepo::EMAIL_TXTFIELD)

  def set_email_txtfield(email)
    self.email_txtfield = email
  end

  def clear_email_txtfield
    clear_email_txtfield
  end

  Accessors.text_field(:pwd_txtfield, ObjectRepo::PWD_TXTFIELD)

  def set_pwd_txtfield(email)
    self.pwd_txtfield = email
  end

  def clear_pwd_txtfield
    clear_pwd_txtfield
  end

  Accessors.text(:forgot_pwd_link, ObjectRepo::FORGOT_PWD_LINK)

  def tap_forgot_pwd_link
    forgot_pwd_link
  end

  Accessors.text_field(:phone_txtfield, ObjectRepo::PHONE_TXTFIELD)

  def set_phone_txtfield(phone)
    self.phone_txtfield = phone
  end

  # Facebook screen methods
  Accessors.text_field(:fb_email_txtfield, ObjectRepo::FB_EMAIL_TXTFIELD)

  def set_fb_email_txtfield(email)
    self.fb_email_txtfield = email
  end

  def clear_fb_email_txtfield
    clear_fb_email_txtfield
  end

  Accessors.text_field(:fb_pw_txtfield, ObjectRepo::FB_PW_TXTFIELD)

  def set_fb_pw_txtfield(pwd)
    self.fb_pw_txtfield = pwd
  end

  def clear_fb_pw_txtfield
    clear_fb_pw_txtfield
  end

  Accessors.text(:fb_login_btn, ObjectRepo:: FB_LOG_IN_BTN)

  def tap_fb_login_btn
    fb_login_btn
    ReusableFunction.wait_for(7)
  end

  Accessors.text(:fb_continue_btn, ObjectRepo::FB_CONTINUE_BTN)

  def tap_fb_continue_btn
    btn = find_element(:xpath, '//android.widget.Button[@content-desc="Continue"]')

    begin
      btn.click
    rescue StandardError
      fb_continue_btn
    end
    ReusableFunction.wait_for(5)
  end

  # Page Nav - Sign In with Email
  def sign_in_with_email
    tap_signin_email_phone_btn
    tap_sign_in_email_btn
    set_email_txtfield(TestData.use_data('credentials', 'verified_email'))
    set_pwd_txtfield(TestData.use_data('credentials', 'verified_password'))
  end

  def sign_in_with_bet_email
    tap_signin_email_phone_btn
    tap_sign_in_email_btn
    set_email_txtfield(TestData.use_data('credentials', 'nofollowers_email'))
    set_pwd_txtfield(TestData.use_data('credentials', 'followers_test_password'))
  end

  # Gmail screen methods
  Accessors.text_field(:gmail_txtfield, ObjectRepo::GMAIL_TXTFIELD)

  def sign_in_with_email_non_us
    tap_signin_email_phone_btn
    tap_sign_in_email_btn
    set_email_txtfield(TestData.use_data('credentials', 'verified_email'))
    set_pwd_txtfield(TestData.use_data('credentials', 'verified_password'))
  end
end