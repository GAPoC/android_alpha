Feature: My Squad

  Background:
    Given I sign in to use the app

  @regression
  Scenario: Verify My Squad Options from My Profile
    When I tap on the "settings" icon from toolbar menu
    Then I tap on "My Profile" textview
    When I tap on the "Followers" profile option
    And I verify that "Followers" screen in the current screen
    When I tap on the navigate back button
    When I tap on the "Following" profile option
    And I verify that "Following" screen in the current screen
    And I tap on the navigate back button
    And I tap on the navigate back button
    Then I sign out to clear the device

  @ready_for_qaStream
  Scenario: Following a User
    When I tap on the "home" icon tab
    And I tap on the "search" icon from toolbar menu
    Then I use the menu to search for "dodgeball"
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    Then I add a friend from a stream
    Then I tap on the navigate back button
    Then Dismiss "Help your friends find you" alert by clicking "No Thanks"
    Then I tap on the navigate back button
    Then I tap on the "my br" icon tab
    Then Dismiss "Help Us Improve the App" alert by clicking "No Thanks"
    And I tap on "Following" textview
    Then I am redirected to the "Following" screen
    Then the person I'm following is shown

  @ready_for_qaStream
  Scenario: Unfollow a User
    Then I tap on the "my br" icon tab
    When I tap on "Following" textview
    Then I am able to unfollow people from my squad list

  @regression
  Scenario: Invite Friends
    Then I tap on the "my br" icon tab
    Then Dismiss "Help Us Improve the App" alert by clicking "No Thanks"
    When I tap on "Following" textview
    Then I tap on the "invite" button
    Then the "Connect with Friends" screen is displayed