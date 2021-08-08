require_all 'features/support/object_repository.rb'
require_all 'features/support/accessors.rb'

# Class to define Choose Your Team Screen
# element functionalities
class ChooseYourTeamScreen
  include Accessors
  extend ObjectRepo

  Accessors.text(:choose_your_team_header, ObjectRepo::TOOLBAR_TITLE)
  def get_choose_your_team_header_text
    choose_your_team_header_text
  end

  # Methods for search textfield
  Accessors.text_field(:search_txtfield, ObjectRepo::SEARCH_TXTFIELD)
  def set_search_txtfield(search)
    self.search_txtfield = search
  end

  def clear_search_txtfield
    clear_search_txtfield
  end

  # Method for checkbox and checkbox status
  Accessors.element(:checkbox_btn, ObjectRepo::CHECKBOX_BTN)
  def get_checkbox_attribute
    checkbox_btn.element.attribute('checked')
  end

  # Methods for show local teams btn
  Accessors.text(:show_local_team_btn, ObjectRepo::SHOW_LOCAL_TEAMS_BTN)
  def tap_show_local_team_btn
    show_local_team_btn
  end

  # Pick teams page nav
  def choose_teams(team)
    global_ele = GlobalScreenElements.new

    ReusableFunction.wait_for(7)

    begin
      if get_choose_your_team_header_text == 'Choose Your Teams'
        pick_teams_via_search(team)
        global_ele.tap_done_btn
      end
    rescue StandardError
      puts('Choose Your Teams screen is not shown')
    end
  end

  # Choose Team Page Navigation
  def search_and_choose(team)
    ReusableFunction.wait_for(3)
    set_search_txtfield(team)
    if get_checkbox_attribute.to_s.eql?('false')
      find_element(:xpath, "//android.widget.TextView[@text='#{team}']").click
    end
  end

  def search_name(name)
    ReusableFunction.wait_for(3)
    set_search_txtfield(name)
  end

  def pick_teams_via_search_flow(player)
    # Array of locales available
    locale = %w[en_GB en_AU nl_BE]
    # GDPR test stream
    gdpr_stream = TestData.use_data('search_options', 'gdpr_stream')

    if locale.include? ENV['LOCALE'].to_s
      # Script to search for team/player when testing GDPR flow
      search_and_choose(gdpr_stream)
    else
      # Script to search for team/player when testing regular flow
      search_and_choose(player)
    end
  end
end