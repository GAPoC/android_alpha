require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Alerts Screen
# element functionalities
class AlertsScreen
  include Accessors
  extend ObjectRepo

  # TEXT Element
  Accessors.text(:alert_badge, ObjectRepo::ALERT_BADGE)
  def alert_badge_exist
    alert_badge?
  end

  def get_alert_badge_text
    alert_badge_text
  end

  def tap_alert_badge
    alert_badge
  end
end