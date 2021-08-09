@applitools @garegapp
Feature: Articles - Podcast Stream

  Background:
    Given I navigate to the "my br" tab

  Scenario: Verify Podcast List UI
    When I tap on the add button from my teams
    And I scroll to "Podcasts"
    Then I tap on the "Podcasts" team option
    Then the "Podcasts List" screen is displayed

  Scenario: Verify podcasts stream is shown
    When I tap on the "search" icon from toolbar menu
    And I use the menu to search for "The Dan Patrick Show"
    Then the "The Dan Patrick Show - Podcast Stream" screen is displayed