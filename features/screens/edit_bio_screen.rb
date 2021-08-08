require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Edit Bio Screen
# element functionalities
class EditBioScreen
  include Accessors
  extend ObjectRepo

  # Textfield Method
  Accessors.text_field(:edit_bio_txtfield, ObjectRepo::EDIT_BIO_TXTFIELD)
  Accessors.text(:edit_bio_txt, ObjectRepo::EDIT_BIO_TXTFIELD)

  def set_edit_bio_txtfield(bio)
    self.edit_bio_txtfield = bio
  end

  def tap_edit_bio_txtfield
    edit_bio_txt
  end
end