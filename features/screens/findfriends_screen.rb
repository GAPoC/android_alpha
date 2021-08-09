require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Find Friends Screen
# element functionalities
class FindFriendsScreen
  include Accessors
  extend ObjectRepo

  Accessors.button(:invite_btn, ObjectRepo::ACTION_INVITE_BTN)

  def tap_invite_btn
    invite_btn
  end
end