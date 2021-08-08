require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Ads Screen
# element functionalities
class AdsScreen
  include ObjectRepo
  extend Accessors

  # IMG Element
  Accessors.image(:ads_image, ObjectRepo::AD_IMAGE)
  def verify_ads_image_exist
    ReusableFunction.wait_for('Ads Image') { ads_image? }
  end
end