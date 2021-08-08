require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Experiment Modal Screen
# element functionalities
class Experiments
  include Accessors
  extend ObjectRepo

  def skip_headline_popup_flow
    skip_pop_up_modal if on(GlobalScreenElements).verify_headline_view_exist
  rescue StandardError
    puts 'Pop Up modal is not present'
  end

  Accessors.button(:close_modal_btn, ObjectRepo::POPUP_CLOSE_BTN)
  def verify_modal_btn
    close_modal_btn?
  end

  def tap_close_modal_btn
    if verify_modal_btn
      close_modal_btn
    else
      back
    end
  end
end