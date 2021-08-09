require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Mute User Screen
# element functionalities
class MuteUser
  include Accessors
  extend ObjectRepo

  # BUTTON Elements
  Accessors.button(:mute_unmute_user, ObjectRepo::COMMENT_OPTIONS)

  # TODO: Pending Code - Please delete if no longer in use
end