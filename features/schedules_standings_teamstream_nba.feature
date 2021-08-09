@applitools
Feature: Schedules from Gamecast - NBA

  Background:
    Given I navigate to the "home" tab
    When I tap on the "search" icon from toolbar menu

  @TEST_QA-5498
  Scenario: Verify NBA Schedules - Team Stream UI
    And I use the menu to search for "Golden State Warriors"
    And Dismiss "Get NBA Rumors First" alert by clicking "No Thanks"
    And I tap on the "schedules" stream button
    Then the "NBA - Schedule" screen is displayed
    Then I tap on the "standings" stream button
    Then the "NBA - Standings" screen is displayed