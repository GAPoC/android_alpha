@applitools
Feature: Schedules from Gamecast - College FB

  Background:
    Given I navigate to the "home" tab
    When I tap on the "search" icon from toolbar menu

  @TEST_QA-5628
  Scenario: Verify College FB Schedules - Team Stream UI
    And I use the menu to search for "Michigan Football"
    And Dismiss "Out of the Playoffs?" alert by clicking "No Thanks"
    And I tap on the "schedules" stream button
    Then the "College FB - Schedule" screen is displayed
    Then I tap on the "standings" stream button
    Then the "College FB - Standings" screen is displayed