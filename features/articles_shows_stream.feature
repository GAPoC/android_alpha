@applitools
Feature: Articles - Shows Stream

  Background:
    Given I navigate to the "my br" tab

  Scenario: Verify Podcast List UI
    When I tap on the add button from my teams
    And I enter "Shows" list
    Then the "Shows List" screen is displayed

  Scenario: Verify Shows stream is shown
    When I tap on the "search" icon from toolbar menu
    And I use the menu to search for "Gridiron Heights"
    Then the "Gridiron Heights - Show Stream" screen is displayed