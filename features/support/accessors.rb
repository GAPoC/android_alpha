require_relative '../../features/support/element_helper.rb'

module Accessors

  def self.button(name, locator)

    # generates method for clicking button.
    # this method will not return any value.
    # @example click on 'Submit' button.
    # button(:login_button,"xpath~//UIButtonField")
    # def click_login_button
    #  login_button # This will click on the button.
    # end

    #Click Button
    define_method("#{name}") do
      ElementHelper.new(locator).click
    end

    #Check if button is enabled
    define_method("#{name}_enabled?") do
      ElementHelper.new(locator).enabled?
    end

    #Check if button exists
    define_method("#{name}?") do
      ElementHelper.new(locator).exists?
    end
  end

  # Image class generates all the methods related to different operations that can be performed on the image object on the screen.
  def self.image(name,locator)

    # generates method for checking the existence of the image.
    # this will return true or false based on if image is available or not
    # @example check if 'logo' image is displayed on the page
    # text(:logo,"xpath~//UITextField")
    # DSL for clicking the logo image.
    # def click_logo
    #  logo # This will click on the logo text on the screen.
    # end

    #Check if image exists
    define_method("#{name}?") do
      ElementHelper.new(locator).exists?
    end

    #Click Image
    define_method("#{name}") do
      ElementHelper.new(locator).click
    end
  end

  def self.text(name,locator)
    # generates method for clicking button.
    # this method will not return any value.
    # @example click on 'Submit' button.
    # button(:login_button,"xpath~//UIButtonField")
    # def click_login_button
    #  login_button # This will click on the button.
    # end

    #Check if Text exists
    define_method("#{name}?") do
      ElementHelper.new(locator).exists?
    end

    #Clicks on text
    define_method("#{name}") do
      ElementHelper.new(locator).click
    end

    #Get text property
    define_method("#{name}_text") do
      ElementHelper.new(locator).text
    end

    #Checks the value of a text
    define_method("#{name}_value") do
      ElementHelper.new(locator).value
    end

    define_method("#{name}_dynamic_text") do |text|
      ElementHelper.new(locator).dynamic_text_exists?(text)
    end
  end

  # text_field class generates all the methods related to different operations that can be performed on the text_field object on the screen.
  def self.text_field(name,locator)

    # generates method for setting text into text field.
    # There is no return value for this method.
    # @example setting username field.
    # DSL for entering text in username text field.
    # def set_username_text_field(username)
    #   self.username=username   # This method will enter text into username text field.
    # end

    #Send Key to textfield
    define_method("#{name}=") do |text|
      ElementHelper.new(locator).text=text
    end

    #Get textfield text
    define_method("#{name}_text") do
      ElementHelper.new(locator).text
    end

    #Clear textfield
    define_method("clear_#{name}") do
      ElementHelper.new(locator).clear
    end

    #Check if textfield exist
    define_method("#{name}?") do
      ElementHelper.new(locator).exist?
    end

    #Get textfield value
    define_method("#{name}_value") do
      ElementHelper.new(locator).value
    end

    #Check if textfield is enabled
    define_method("#{name}_enabled?") do
      ElementHelper.new(locator).enabled?
    end
  end

  # table class generates all the methods
  # related to different operations that can be
  # performed on the table object on the screen.
  def self.table(name, locator)
    #generates method for counting total no of cells in table
    define_method("#{name}_cell_count") do
      ElementHelper.new(locator).cell_count
    end
  end

  def self.element(name, locator)
    #generates method for elements object
    define_method("#{name}") do
      ElementHelper.new(locator)
    end
  end
end