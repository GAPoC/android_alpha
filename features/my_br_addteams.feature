Feature: My BR - Add Teams

  @regression
  Scenario: Add Team From Search - Snack Bar Functionality
    Given I navigate to the "home" tab
    When I tap on the "search" icon from toolbar menu
    And I use the menu to search for "Freestyle Soccer"
    Then I am able to add "Freestyle Soccer" to my teams
    And I tap on the "my br" icon tab
    And Dismiss "Help your friends find you" alert by clicking "No thanks"
    When I tap on the "search" icon from toolbar menu
    And I use the menu to search for "Freestyle Soccer"
    Then the "add team snackbar" is not displayed

  @regression
  Scenario: Verify Remove and Add a Team Functionality
    Given I navigate to the "my br" tab
    When I add a 'Sydney FC' to my teams
    When I tap on the "Manage Streams" icon from toolbar menu
    Then I can remove the 'Sydney FC' from my teams
    And I tap on the save button
    Then the "Sydney FC" I removed is not displayed in my teams