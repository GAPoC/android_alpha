@applitools
Feature: My B/R - User Signed In

  Background:
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    Then the "Find Out Who You Know on B/R" social promo is "shown"

  Scenario: Verify MY BR User Signed in UI Screen
    Then the "My BR - Signed In" screen is displayed
    Then I sign out to clear the device

  Scenario: Verify tapping function in MY BR - User Signed In
    When I tap on the "Edit Profile" button
    Then the textview "My Profile" is displayed
    When I tap on the "Following" profile option
    Then the "Following" screen is displayed
    And I tap on the navigate back button
    When I tap on the "Followers" profile option
    Then the "Followers" screen is displayed
    And I tap on the navigate back button
    And I tap on the navigate back button
    Then I sign out to clear the device