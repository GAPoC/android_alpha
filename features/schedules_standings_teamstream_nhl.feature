@applitools
Feature: Schedules from Gamecast - NHL

  Background:
    Given I navigate to the "home" tab
    When I tap on the "search" icon from toolbar menu

  @TEST_QA-7490
  Scenario: Verify NHL Schedules - Team Stream UI
    And I use the menu to search for "San Jose Sharks"
    And Dismiss "Out of the Playoffs?" alert by clicking "No Thanks"
    And I tap on "Schedule" textview
    Then the "NHL Teamstream - Schedule" screen is displayed
    Then I tap on the "standings" stream button
    Then the "NHL Teamstream - Standings" screen is displayed