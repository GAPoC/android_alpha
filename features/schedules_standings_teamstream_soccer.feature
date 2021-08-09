@applitools
Feature: Schedules from Gamecast - Soccer

  Background:
    Given I navigate to the "home" tab
    When I tap on the "search" icon from toolbar menu

  @TEST_QA-5626
  Scenario: Verify Soccer Schedules - Team Stream UI
    And I use the menu to search for "Manchester United"
    And Dismiss "Out of the Playoffs?" alert by clicking "No Thanks"
    And I tap on the "schedules" stream button
    Then the "Soccer - Schedule" screen is displayed
    Then I tap on the "standings" stream button
    Then the "Soccer - Standings" screen is displayed