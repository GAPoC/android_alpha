@applitools
Feature: Schedules from Gamecast - MLB

  Background:
    Given I navigate to the "home" tab
    When I tap on the "search" icon from toolbar menu

  @TEST_QA-5493
  Scenario: Verify MLB Schedules - Team Stream UI
    And I use the menu to search for "San Francisco Giants"
    And Dismiss "Out of the Playoffs?" alert by clicking "No Thanks"
    And I tap on the "schedules" stream button
    Then the "MLB - Schedule" screen is displayed
    Then I tap on the "standings" stream button
    Then the "MLB - Standings" screen is displayed