#Helper class to split objectrepo into switch
class ElementHelper

  def initialize(const_var)
    @locator = const_var.split('~')
  end

  def driver
    $driver
  end

  def click
    element.click
  end

  def value
    element.value
  end

  def text=(text)
    element.send_keys text
  end

  def text
    element.text
  end

  def exists?
    begin
      element.displayed?
    rescue
      false
    end
  end

  def cell_count
    elements.length
  end

  def element
    driver.find_element(:"#{@locator[0]}", @locator[1])
  end

  def elements
    driver.find_elements(:"#{@locator[0]}", @locator[1])
  end

  def element_attributes
    %w[name resource-id value text]
  end

  def dynamic_xpath(text)
    concat_attribute = []
    element_attributes.each { |i| concat_attribute << %Q(contains(@#{i}, '#{text}')) }
    puts "//#{@locator[0]}[#{concat_attribute.join(' or ')}]"
    locator1 = "xpath~//#{@locator[0]}[#{concat_attribute.join(' or ')}]"
    @locator = locator1.split("~")
    element
  end

  #TextField Helper
  def clear
    element.clear
  end

  def enabled?
    begin
      element.enabled?
    rescue
      false
    end
  end

  #Text Helper
  def dynamic_text_exists? dynamic_text
    begin
      dynamic_xpath(dynamic_text).displayed?
    rescue
      false
    end
  end

  #Scroll Helper
  def scroll
    $driver.execute_script 'mobile: scrollTo', :element => element.ref
    # $driver.execute_script("mobile: scroll",:direction => direction.downcase, :element => element.ref)
  end

  def scroll_to_text(text)
    $driver.scroll_to(text)
  end

  def scroll_to_exact_text(text)
    $driver.scroll_to_exact(text)
  end

  def scroll_for_element_click
    if element.displayed?
      element.click
    else
      scroll
      element.click
    end
  end

  def scroll_for_dynamic_element_click (expected_text)
    if dynamic_xpath(expected_text).displayed?
      element.click
    else
      scroll
      element.click
    end
  end

  def click_text(text)
    if exists?
      click
    else
      scroll_to_text(text)
      element.click
    end
  end

  def click_dynamic_text(text)
    if dynamic_text_exists?(text)
      element.click
    else
      scroll_to_text(text)
      element.click
    end
  end

  def click_exact_text(text)
    if exists?
      click
    else
      scroll_to_exact_text(text)
      element.click
    end
  end

  def click_dynamic_exact_text(text)
    if dynamic_text_exists?(text)
      element.click
    else
      scroll_to_exact_text(text)
      element.click
    end
  end
end