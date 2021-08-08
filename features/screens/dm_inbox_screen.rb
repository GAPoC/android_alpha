require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define DM Inbox Screen
# element functionalities
class DMInboxScreen
  include Accessors
  extend ObjectRepo

  # Button Element
  Accessors.button(:add_chat_btn, ObjectRepo::ADD_CHAT_BTN)
  def tap_add_chat_btn
    add_chat_btn
  end

  Accessors.button(:send_message_btn, ObjectRepo::SEND_MESSAGE_BTN)
  def tap_send_message_btn
    send_message_btn
  end

  Accessors.button(:chat_details_btn, ObjectRepo::CHAT_DETAILS_BTN)
  def tap_chat_details_btn
    chat_details_btn
  end

  Accessors.button(:add_member_btn, ObjectRepo::ADD_MEMBER_BTN)
  def tap_add_member_btn
    add_member_btn
  end

  Accessors.button(:send_first_msg_btn, ObjectRepo::SEND_FIRST_MSG_BTN)
  def tap_send_first_msg_btn
    send_first_msg_btn
  end

  Accessors.button(:new_chat_btn, ObjectRepo::NEW_CHAT_BTN)
  def tap_new_chat_btn
    new_chat_btn
  end

  Accessors.button(:dm_gif_btn, ObjectRepo::DM_GIF_BTN)
  def tap_dm_gif_btn
    dm_gif_btn
  end

  # Methods for search for friends textfield
  Accessors.text_field(:search_for_friends_txtfield, ObjectRepo::SEARCH_FOR_FRIENDS_TXTFIELD)
  Accessors.button(:txtfield_btn, ObjectRepo::SEARCH_FOR_FRIENDS_TXTFIELD)

  def set_search_for_friends_txtfield(search)
    self.search_for_friends_txtfield = search
  end

  def tap_txtfield
    txtfield_btn
  end

  # Methods for edit chat name textfield
  Accessors.text_field(:edit_chat_name_txtfield, ObjectRepo::EDIT_CHAT_NAME_TXTFIELD)
  Accessors.button(:txtfield_btn, ObjectRepo::EDIT_CHAT_NAME_TXTFIELD)

  def set_edit_chat_name_txtfield(name)
    find_element(:id, 'com.bleacherreport.android.teamstream:id/edit_name').click
    find_element(:id, 'com.bleacherreport.android.teamstream:id/edit_name').send_keys(name)
    # Tap on the enter key. Other options didn't work.
    Appium::TouchAction.new.tap(x: 1000, y: 2000).perform
    ReusableFunction.hide_keyboard_option
    ReusableFunction.wait_for(5)
  end

  # Methods for send message textfield
  Accessors.text_field(:send_msg_txtfield, ObjectRepo::SEND_MSG_TXTFIELD)
  Accessors.text(:txtfield_txt, ObjectRepo::SEND_MSG_TXTFIELD)

  def set_send_msg_txtfield(message)
    self.send_msg_txtfield = message
  end

  def tap_send_msg_txtfield
    send_msg_txtfield_txt
  end
end