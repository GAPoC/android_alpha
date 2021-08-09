@applitools
Feature: Settings - My Profile

  Scenario: Navigate to My Profile
    Given I navigate to the "my br" tab
    And I tap on the "settings" icon from toolbar menu
    And I sign in through settings for "US" locales
    And Dismiss "Help your friends find you" alert by clicking "No thanks"
    And I tap on the "My Profile" option in settings
    Then I am redirected to the "My Profile" screen
    And I tap on the navigate back button
    Then I sign out to clear the device