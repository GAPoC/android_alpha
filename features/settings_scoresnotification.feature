@regression
Feature: Settings - Scores Notification

  Scenario: Verify user can toggle scores and spoilers
    Given I navigate to the "home" tab
    And I tap on the "settings" icon from toolbar menu
    And I navigate to notification details
    Then I can "disable" the scores and spoilers
    And I can "enable" the scores and spoilers