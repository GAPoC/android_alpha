require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Twitter Screen
# element functionalities
class TwitterScreen
  include Accessors
  extend ObjectRepo

  # -------- TEXT ELEMENTS -------- #
  Accessors.text(:tweet_username, ObjectRepo::TWEET_USERNAME)

  def get_tweet_username_txt
    tweet_username_text
  end

  # -------- IMAGE ELEMENTS -------- #
  Accessors.image(:tweet_img_profile, ObjectRepo::TWEET_IMG_PROFILE)

  def tap_tweet_profile_img
    tweet_img_profile
  end

  Accessors.image(:tweet_bird_img, ObjectRepo::TWEET_BIRD_ICON)

  def verify_tweet_bird_img_exist
    tweet_bird_img?
  end

  def tap_tweet_bird_img
    tweet_bird_img
  end
end