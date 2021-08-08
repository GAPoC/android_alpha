require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Commentary FM Gamecast Screen
# element functionalities
class CommentaryFmGamecast
  include Accessors
  extend ObjectRepo

  # Methods for sign in button elements
  Accessors.text(:sign_in_btn_gc, ObjectRepo::SIGN_IN_BTN_GC)
  def tap_sign_in_btn_gc
    sign_in_btn_gc
  end

  # Methods for Create Username button elements
  Accessors.text(:create_usrname_btn, ObjectRepo::CREATE_USRNAME_BTN)
  def tap_create_usrname_btn
    create_usrname_btn
  end

  # Methods for Comments sorting button elements
  Accessors.text(:comment_sort_btn, ObjectRepo::SORT_ORDER_LABEL)
  def tap_comment_sort_btn
    comment_sort_btn
  end

  # Methods for Fire Comments button elements
  Accessors.text(:fire_comment_btn, ObjectRepo::FIRE_COMMENT_BTN)
  def tap_fire_comment_btn
    fire_comment_btn
  end

  # Methods for Comments Replay button elements
  Accessors.text(:comment_reply_btn, ObjectRepo::COMMENT_REPLY_BTN)
  def tap_comment_reply_btn
    comment_reply_btn
  end

  # Methods for Profile icon elements
  Accessors.text(:profile_comments_icon, ObjectRepo::PROFILE_COMMENTS)
  def tap_profile_comments_icon
    profile_comments_icon
  end
end