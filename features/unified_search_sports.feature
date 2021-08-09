@regression
Feature: Unified Search - Sports

  Background:
    Given I navigate to the "home" tab

  Scenario: Verify is user able to select Sports Results
    When I tap on the "search" icon from toolbar menu
    And I enter a search term into unified search "FC Barcelona"
    And I tap on "Sports" textview
    And I tap on "FC Barcelona" textview
    Then the textview "FC Barcelona" is displayed