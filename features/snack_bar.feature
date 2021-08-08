@regression @experiment
Feature: Snack bar

  Background:
    Given I sign in to use the app

  Scenario: Verify Add Team Snackbar is not displayed
    When I tap on the "search" icon from toolbar menu
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    And I use the menu to search for "David Timor"
    Then the "add team snackbar" is not displayed
    When I tap into the "comment" textfield
    Then the "add team snackbar" is displayed
    And I navigate back using device back button
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    Then I sign out to clear the device