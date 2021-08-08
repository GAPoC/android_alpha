@applitools
Feature: User Profile - Following

  Scenario: Verify Following - User Profile UI
    Given I sign in to use the app
    Then I tap on the "my br" icon tab
    And I tap on "Following" textview
    Then the "following" user profile is shown
    Then I tap on the navigate back button
    Then I tap on the navigate back button
    And I sign out to clear the device