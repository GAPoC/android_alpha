Feature: Schedules from Gamecast - NFL

  Background:
    Given I navigate to the "home" tab
    When I tap on the "search" icon from toolbar menu

  @applitools @TEST_QA-5507
  Scenario: Verify NFL Schedules - Team Stream UI
    And I use the menu to search for "Las Vegas Raiders"
    And Dismiss "Draft SZN Is Here" alert by clicking "No Thanks"
    And I tap on the "schedules" stream button
    Then the "NFL - Schedule" screen is displayed
    Then I tap on the "standings" stream button
    Then the "NFL - Standings" screen is displayed