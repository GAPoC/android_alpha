require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Gamecast Screen
# element functionalities
class GamecastScreenElements
  include Accessors
  extend ObjectRepo

  # ------- Methods for reusable button elements -------

  Accessors.image(:teamstream_gamecast, ObjectRepo::TEAMSTREAM_GAMECAST)
  def tap_teamstream_gamecast
    teamstream_gamecast
  end

  def verify_teamstream_gamecast_exist?
    sleep 1
    raise 'Gamecast header text not present' unless teamstream_gamecast?
  end

  # -------- IMAGE ELEMENTS -------- #

  Accessors.text(:team_name, ObjectRepo::TEAM_NAME)
  def verify_team_name_exists
    raise 'Team name header text not present' unless team_name?
  end

  Accessors.text(:team1_name, ObjectRepo::TEAM_1_NAME)
  def tap_team1_name
    team1_name
  end
end
