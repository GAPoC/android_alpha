@regression
Feature: Find Friends - From Profile

  Scenario: Tapping on Find Friends from My Profile
    Given I sign in to use the app
    When I tap on the "my br" icon tab
    When I tap on the "find friends" icon from toolbar menu
    Then I am redirected to the "Find Friends" screen
    When I navigate back using device back button
    When I navigate back using device back button
    Then I sign out to clear the device