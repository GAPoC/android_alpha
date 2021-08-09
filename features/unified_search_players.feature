@regression
Feature: Unified Search - Players

  Background:
    Given I navigate to the "home" tab

  Scenario: Verify is user able to select Players Results
    When I tap on the "search" icon from toolbar menu
    And I enter a search term into unified search "Lionel Messi"
    And I tap on "Players" textview
    And I tap on "Lionel Messi" textview
    Then the textview "Lionel Messi" is displayed