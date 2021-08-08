Feature: My Profile

  Background:
    Given I sign in to use the app
    Then I tap on the "my br" icon tab
    And I tap on the "Edit Profile" button

  @applitools
  Scenario: Verify Edit My Account UI
    When I tap on the "username" my account option
    Then the "Edit Username" screen is displayed
    And I tap on the navigate back button
    When I tap on the "full name" my account option
    Then the "Edit Your Name" screen is displayed
    And I tap on the navigate back button
    And I scroll down "1" time
    When I tap on the "phone number" my account option
    Then the "Edit Your Phone Number" screen is displayed
    And I tap on the navigate back button
    And I tap on the navigate back button
    Then I sign out to clear the device
