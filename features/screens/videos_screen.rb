require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Video Screen
# element functionalities
class VideoScreen
  include Accessors
  extend ObjectRepo

  # BUTTON Element
  Accessors.button(:mute_btn, ObjectRepo::VIDEO_MUTE_BTN)
  def verify_mute_btn_exist
    raise('Unable to locate mute btn') unless mute_btn?
  end

  Accessors.button(:play_btn, ObjectRepo:: VIDEO_PLAY_BTN)
  def verify_vid_play_btn_exists
    ReusableFunction.wait_for(3)
    puts 'Unable to locate play btn' unless play_btn?
  end

  def tap_play_btn
    Accessors.button(:play_btn, ObjectRepo:: VIDEO_PLAY_BTN)
  end

  # TEXT Elements
  Accessors.text(:see_all_videos, ObjectRepo::SEE_ALL_VIDEOS)
  def tap_see_all_videos
    see_all_videos
  end

  # FRAME LAYOUT Elements
  Accessors.button(:br_video_module, ObjectRepo::BR_VIDEO_MODULE)
  def tap_br_video_module
    br_video_module
  end

  def verify_br_video_module
    br_video_module?
  end
end