require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define My Profile Screen
# element functionalities
class MyProfileScreen
  include Accessors
  extend ObjectRepo

  # Text Element
  Accessors.text(:share_invite_btn, ObjectRepo::SHARE_INVITE_BTN)
  def tap_share_invite_btn
    share_invite_btn
  end

  Accessors.text(:update_profile_pic, ObjectRepo::PROFILE_PIC_LINK)
  def tap_update_profile_pic
    update_profile_pic
  end

  def get_update_profile_pic_text
    update_profile_pic_text
  end

  Accessors.text(:followers_txt, ObjectRepo::FOLLOWER_TXT)
  def tap_followers_txt
    followers_txt
  end

  Accessors.text(:following_txt, ObjectRepo::FOLLOWING_TXT)
  def tap_following_txt
    following_txt
  end

  Accessors.text(:username_txtview, ObjectRepo::USERNAME_TEXTVIEW)
  def tap_username_txtview
    username_txtview
  end

  Accessors.text(:profile_muted_banner, ObjectRepo::PROFILE_MUTED_TXT)
  def verify_profile_muted_banner
    profile_muted_banner?
  end

  Accessors.text(:user_bio_txt, ObjectRepo::USER_BIO_TXT)
  def get_user_bio_txt
    user_bio_txt_text
  end

  Accessors.text(:user_profile_bio, ObjectRepo::USER_PROFILE_BIO)
  def verify_user_profile_bio_exists
    user_profile_bio?
  end

  def get_user_profile_bio_txt
    user_profile_bio_text
  end

  Accessors.text(:username, ObjectRepo::USERNAME_NAME)
  def verify_username_exist
    username?
  end

  # Button Element
  Accessors.button(:follow_btn, ObjectRepo::FOLLOW_BTN)
  def tap_follow_btn
    follow_btn
  end

  # IMAGE Elements
  Accessors.image(:profile_image, ObjectRepo::PROFILE_IMG)
  def tap_profile_image
    profile_image
  end

  def tap_image_done_btn
    find_element(:xpath, "//android.widget.Button[@text='Done']").click
  end

  def tap_more_profile_options
    find_element(:xpath, '//android.widget.ImageView[@content-desc="More options"]').click
  end

  def verify_more_profile_options
    find_element(:xpath, '//android.widget.ImageView[@content-desc="More options"]').displayed?
  end

  Accessors.button(:edit_username_btn, ObjectRepo::EDIT_USERNAME_BTN)
  def tap_edit_username_btn
    edit_username_btn
  end

  Accessors.button(:edit_fullname_btn, ObjectRepo::EDIT_FULLNAME_BTN)
  def tap_edit_fullname_btn
    edit_fullname_btn
  end

  Accessors.button(:edit_phone_btn, ObjectRepo::EDIT_PHONE_BTN)
  def tap_edit_phone_btn
    edit_phone_btn
  end

  Accessors.button(:edit_email_btn, ObjectRepo::EDIT_EMAIL_BTN)
  def tap_edit_email_btn
    edit_email_btn
  end

  # Textfield Element
  Accessors.text_field(:search_username_txtfield, ObjectRepo::SEARCH_EDIT_TXTFIELD)
  def set_search_username_txtfield(text)
    self.search_username_txtfield = text
  end
end