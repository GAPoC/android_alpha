@regression
Feature: Scores Tab - Reset

  Background:
    Given I navigate to the "scores" tab

  @TEST_QA-2406
  Scenario: Verify tapping scores tab resets user to top games and today's date
    Then I select a date from the scores calendar
    And I tap on the "MLB" scores tab picker
    And I tap on the "scores" icon tab
    Then the textview "Top Games" is displayed
    Then the textview "Today" is displayed

  @TEST_QA-7558
  Scenario: Verify tapping on the same sports tab resets the calendar
    Then I select a date from the scores calendar
    And I tap on the "MLB" scores tab picker
    And I tap on the "MLB" scores tab picker
    Then the textview "Today" is displayed

  @TEST_QA-7559
  Scenario: Verify tapping on the same sports tab with a dropdown resets the default choices
    When I tap on the "College BB" scores tab picker
    And I can switch leagues to "PAC-12"
    Then I select a date from the scores calendar
    When I tap on the "College BB" scores tab picker
    Then the textview "Today" is displayed
    Then the textview "NCAA TOURNAMENT" is displayed