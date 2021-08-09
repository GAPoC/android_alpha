require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Community Screen
# element functionalities
class CommunityScreen
  include Accessors
  extend ObjectRepo

  Accessors.text(:sort_order_label, ObjectRepo::SORT_ORDER_LABEL)

  def tap_sort_order_label
    sort_order_label
  end

  def verify_sort_order_label_exist
    ReusableFunction.wait_for(3)
    sort_order_label?
  end

  def get_sort_order_label
    sort_order_label_text
  end

  Accessors.button(:sort_button, ObjectRepo::SORT_BTN)

  def tap_sort_btn
    sort_button
  end

  Accessors.text(:popup_alert_option, ObjectRepo::POPUP_ALERT_OPTION)
  Accessors.element(:popup_alert_option_elem, ObjectRepo::POPUP_ALERT_OPTION)

  # Community Sort Pop-up alert options
  def tap_sort_alert_option(option)
    ele = find_element(:xpath, "//android.widget.CheckedTextView[@text='#{option}']")
    ele.click
  end

  # Caret to sort comments
  Accessors.image(:sort_caret, ObjectRepo::SORT_COMMENT_CARET)

  def verify_exist_sort_caret
    sort_caret?
  end

  def tap_sort_caret
    sort_caret
  end
end