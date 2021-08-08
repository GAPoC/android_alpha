@applitools
Feature: Find Friends - Search

  Background:
    Given I sign in to use the app

  Scenario: Verify the ability to search for a user
    Then I tap on the "my br" icon tab
    And I tap on the "find friends" icon from toolbar menu
    And I tap on the "search for friends" icon from toolbar menu
    Then the "Search For Friends" screen is displayed
    Then I am able to search for friends by "username"
    And I tap on the navigate back button
    And I sign out to clear the device