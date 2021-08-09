require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Stream Screen
# element functionalities
class StreamScreen
  include Accessors
  extend ObjectRepo

  Accessors.text(:schedules_btn, ObjectRepo::SCHEDULES_BTN)
  def tap_schedules_btn
    schedules_btn
    ReusableFunction.wait_for(5)
  end

  Accessors.text(:standings_btn, ObjectRepo::STANDINGS_BTN)
  def tap_standings_btn
    standings_btn
    ReusableFunction.wait_for(5)
  end

  Accessors.text(:standings_gcast_btn, ObjectRepo::STANDINGS_GCAST_BTN)
  def tap_standings_gcast_btn
    standings_gcast_btn
    ReusableFunction.wait_for(5)
  end

  Accessors.text(:recommendation_heading_txt, ObjectRepo::RECOMMENDATION_HEADING_TXT)
  def verify_recommendation_heading_txt_exists
    recommendation_heading_txt?
  end

  Accessors.button(:recommendation_carousel_module, ObjectRepo::RECOMMENDATION_CAROUSEL_MODULE)
  def verify_recommendation_carousel_module_exists
    recommendation_carousel_module?
  end

  def tap_see_more_btn
    see_more_btn
  end

  Accessors.button(:stream_edit_btn, ObjectRepo::STREAM_EDIT_BTN)
  def tap_stream_edit_btn
    stream_edit_btn if stream_edit_btn?
  end
end