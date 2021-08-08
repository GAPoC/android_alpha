require 'selenium-webdriver'

# Class for reusable test functions used within the app
class ReusableFunction

  @time = Time.now.to_i.to_s

  def self.generate_username
    username = "BRFri#{rand(1000).to_i}#{@time.slice(0...5)}"
    return username
  end

  def self.generate_email
    return @time + rand(100).to_i.to_s + '@bleacherreport.com'
  end

  def self.generate_comment_msg
    comments = [TestData.use_data('comments','opinion'),
                TestData.use_data('comments','greeting'),
                TestData.use_data('comments', 'question')]

    return comments.sample
  end

  # Scroll coordinates specifically used for me/my teams screen
  def self.scroll_teams_screen
    Appium::TouchAction.new.swipe(start_x: 938,
                                  start_y: 1044,
                                  end_x: 933,
                                  end_y: 1081,
                                  duration: 800).perform
  end

  # Scroll coordinates specifically used for scrolling through streams
  def self.scroll_up
    Appium::TouchAction.new.swipe(start_x: 500,
                                  start_y: 1200,
                                  end_x: 500,
                                  end_y: 400,
                                  duration: 800).perform
  end

  # Scroll coordinates specifically used for scrolling streams
  def self.scroll_down
    Appium::TouchAction.new.swipe(start_x: 500,
                                  start_y: 400,
                                  end_x: 500,
                                  end_y: 1200,
                                  duration: 800).perform
  end

  def self.scroll_to text
    text = %("#{text}")
    args = Appium::Android::scroll_uiselector("new UiSelector().text(#{text})")
    find_element :uiautomator, args
  end

  def self.scroll_to_classname_index
    #functional but requires optimization due to hardcoded values
    find_element(:uiautomator, 'new UiScrollable(new UiSelector().scrollable(true).instance(0)).getChildByText(new UiSelector().className("android.view.ViewGroup").index(5), "Reply")')
  end

  def self.scroll_to_content_desc(content_desc) #Fixme  - Need to dynamically be able to update description without hardcoding
    # find_element(:uiautomator, 'new UiScrollable(new UiSelector().scrollable(true).instance(0)).scrollIntoView(new UiSelector().description("Bookmark"))')
  end

  def self.generate_player_comment
    player = ['KD', 'Ronaldo', 'Lebron', 'Kobe', 'Jordan','Boogie']
    sentence = ["is a Goat","is ShaQtin a fool","is a Snake","is dope"]

    "#{player.sample} #{sentence.sample}"
  end


  # Reusable wait function is intended to replace sleep
  # Optional Capability: Wait for an object before validation with yield
  # Usage: ReusableFunction.wait_for(seconds,element_type) {yield block}
  # Sample: ReusableFunction.wait_for(2,User Logo) {on(UserProfile).user_logo_displayed?}

  def self.wait_for(seconds = 3, element = nil)
    if block_given?
      begin
        sleep(seconds).until { yield }
        #FIXME - [Wait deprecated] Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
      rescue
        raise("Unable to wait for #{element}")
      end
    else
      #FIXME [Wait Deprecated] Selenium::WebDriver::Wait.new(timeout: seconds)
    end
  end

  def self.hide_keyboard_option
    begin
      hide_keyboard
    rescue
      puts 'Keyboard not initialized'
    end
  end

  def self.generate_random_string(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    return Array.new(number) { charset.sample }.join
  end

  def self.generate_user_post
    adjective = ['Awesome', 'Wow!', 'Nice', 'Are we planning on winning?', 'Lets Go!', 'Really?']
    subject = ['Warriors', 'Rockets', 'Michigan State', 'Raiders', 'Soccer', 'NHL']
    verb = ['still winning', 'lets do better!!', 'running the season.', 'tanks tanks tanks!']

    "#{adjective.sample} #{subject.sample} #{verb.sample}"
  end

  def self.get(url)
    navigate.to(url)
  end

end
