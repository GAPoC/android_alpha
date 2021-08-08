@applitools
Feature: Unified Search - Top

  Background:
    Given I navigate to the "home" tab

  Scenario: Verify suggestions are shown and user able to select Top Results
    When I tap on the "search" icon from toolbar menu
    Then the "Unified Search - Initial Top Tab" screen is displayed
    When I enter a search term into unified search "Red"
    And I hide the keyboard
    Then the "Unified Search - Results Top Tab" screen is displayed
    When I tap on "Boston Red Sox" textview
    Then the textview "Boston Red Sox" is displayed
    When I navigate back using device back button
    And I tap on the "search" icon from toolbar menu
    And I enter a search term into unified search "Red"
    And I tap on "View All Sports" textview
    Then the "Unified Search - Results Sports Tab" screen is displayed