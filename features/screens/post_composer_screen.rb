require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Post Composer Screen
# element functionalities
class PostComposerScreen
  include Accessors
  extend ObjectRepo

  # BUTTON Elements
  Accessors.button(:post_btn, ObjectRepo::POST_BTN)
  def check_post_btn_enabled
    post_btn_enabled?
  end

  Accessors.button(:gif_btn, ObjectRepo::GIF_BTN)
  def verify_gif_btn_exists
    gif_btn?
  end

  def tap_gif_btn
    gif_btn
  end

  Accessors.button(:media_btn, ObjectRepo::MEDIA_BTN)
  def verify_media_btn_exists
    media_btn?
  end

  def tap_media_btn
    media_btn
  end

  Accessors.button(:up_btn, ObjectRepo::UP_BTN)
  def tap_up_btn
    up_btn
  end

  Accessors.button(:post_cancel_btn, ObjectRepo::POST_CANCEL_BTN)
  def tap_post_cancel_btn
    post_cancel_btn
  end

  Accessors.button(:gif_close_btn, ObjectRepo::GIF_CLOSE_BTN)
  def tap_close_gif
    gif_close_btn
  end

  Accessors.button(:image_close_btn, ObjectRepo::IMAGE_CLOSE_BTN)
  def tap_close_image
    image_close_btn
  end

  # TEXTFIELD ELEMENT
  Accessors.text_field(:composer_entry_tf, ObjectRepo::POST_ENTRYFIELD)
  def set_composer_entry_txtfield(post)
    self.composer_entry_tf = post
  end

  Accessors.text_field(:gif_search_tf, ObjectRepo::SEARCH_EDIT_TXTFIELD)
  def set_gif_search_txtfield(term)
    self.gif_search_tf = term
  end
end