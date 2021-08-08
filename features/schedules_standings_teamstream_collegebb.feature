@applitools
Feature: Schedules from Gamecast - College BB

  Background:
    Given I navigate to the "home" tab
    When I tap on the "search" icon from toolbar menu

  @TEST_QA-5627
  Scenario: Verify College BB Schedules - Team Stream UI
    And I use the menu to search for "Texas Tech Basketbal"
    And Dismiss "Texas Tech Basketball" alert by clicking "No Thanks"
    And I tap on the "schedules" stream button
    Then the "College BB - Schedule" screen is displayed
    Then I tap on the "standings" stream button
    Then the "College BB - Standings" screen is displayed