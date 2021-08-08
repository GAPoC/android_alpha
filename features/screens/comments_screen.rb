require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Comment Screen
# element functionalities
# FIXME: Class has too many methods
class CommentScreen
  include Accessors
  extend ObjectRepo

  # text_field Methods
  Accessors.text_field(:comment_txtfield, ObjectRepo::COMMENT_TXTFIELD)
  Accessors.text(:comment_txtfield_txt, ObjectRepo::COMMENT_TXTFIELD)

  def tap_comment_txtfield
    comment_txtfield_txt
  end

  def set_comment_txtfield(comment)
    self.comment_txtfield = comment
  end

  def get_comment_txtfield_txt
    comment_txtfield_txt_text
  end

  def clear_comment_txtfield
    id("com.bleacherreport.android.teamstream:id/comment_edit").clear
  end

  # Accessors.text Methods
  Accessors.text(:send_btn, ObjectRepo::COMMENT_SEND_BTN)
  def tap_send_btn
    send_btn
  end

  Accessors.text(:comment_body, ObjectRepo::COMMENT_BODY)
  def verify_comment_body_exist
    comment_body?
  end

  Accessors.text(:reply_btn, ObjectRepo::COMMENT_REPLY_BTN)
  def tap_reply_btn
    reply_btn
  end

  def verify_exist_reply_btn
    raise('Unable to locate reply button') unless reply_btn?
  end

  Accessors.text(:comment_count, ObjectRepo::COMMENT_COUNT)
  def tap_comment_count
    comment_count
  end

  def get_comment_count
    comment_count_text
  end

  def verify_comment_count_exist
    comment_count?
  end

  Accessors.text(:time_ago_txt, ObjectRepo::STREAM_TIMESTAMP)
  def get_time_ago_txt
    time_ago_txt_text
  end

  Accessors.text(:sort_order_label, ObjectRepo::SORT_ORDER_LABEL)
  def get_sort_order_label
    sort_order_label_text
  end

  Accessors.text(:comment_reaction_count, ObjectRepo::COMMENT_REACTIONS_COUNT)
  def get_comment_reaction_count
    comment_reaction_count_text
  end

  def tap_reaction_count
    comment_reaction_count
  end

  # Button Methods
  Accessors.button(:comment_option, ObjectRepo::COMMENT_OPTIONS)
  def verify_comment_option
    ReusableFunction.wait_for(3)
    my_profile = MyProfileScreen.new

    begin
      comment_option?
    rescue StandardError
      my_profile.verify_more_profile_options unless comment_option?
    end
  end

  def tap_comment_option
    my_profile = MyProfileScreen.new

    if !comment_option?
      my_profile.tap_more_profile_options
    else
      comment_option
    end
  end

  Accessors.button(:sort_button, ObjectRepo::SORT_BTN)
  def tap_sort_btn
    sort_button
  end

  Accessors.text(:popup_alert_option, ObjectRepo::POPUP_ALERT_OPTION)
  Accessors.element(:popup_alert_option_elem, ObjectRepo::POPUP_ALERT_OPTION)
  # Comments Sort Pop-up alert options
  def tap_sort_alert_option(option)
    ele = find_element(:xpath, "//android.widget.CheckedTextView[@text='#{option}']")
    ele.click
  end

  # Caret to sort comments
  Accessors.image(:sort_caret, ObjectRepo::SORT_COMMENT_CARET)
  def tap_sort_caret
    sort_caret
  end
end