@regression
Feature: Find Friends - Home Tab Flow

  Background:
    Given I sign in to use the app
    When I tap on the "my br" icon tab

  Scenario: Tapping on Find Friends from Home
    Then I tap on the "find friends" icon from toolbar menu
    And I am redirected to the "Find Friends" screen
    When I navigate back using device back button
    Then I sign out to clear the device