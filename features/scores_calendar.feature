Feature: Scores Tab - Calendar

  Background:
    Given I navigate to the "scores" tab

  @applitools @TEST_QA-7512
  Scenario: Verify scores calendar view UI
    When I tap on "Today" textview
    Then the "Scores Calendar" screen is displayed

  @applitools @TEST_QA-7497
  Scenario: Verify scores calendar 12 month navigation UI
    When I tap on "Today" textview
    Then I tap the "previous" button until the last month from the calendar view
    Then the "Scores Calendar - 12 Months Before" screen is displayed
    And I navigate back using device back button
    When I tap on "Today" textview
    Then I tap the "next" button until the last month from the calendar view
    Then the "Scores Calendar - 12 Months After" screen is displayed

  @regression @TEST_QA-7513
  Scenario: Verify scores calendar navigation previous month functionality
    Then the calendar changes to the "today" month
    Then I tap the "previous" button once from the calendar view
    Then the calendar changes to the "previous" month
    And I navigate back using device back button

  @regression @TEST_QA-7514
  Scenario: Verify scores calendar navigation next month functionality
    Then the calendar changes to the "today" month
    Then I tap the "next" button once from the calendar view
    Then the calendar changes to the "next" month
