@regression
Feature: Standalone View

  Scenario: Mentions
    Given I sign in to use the app
    When I tap on the "alerts" icon tab
    Then I tap on "Activity" textview
    When I tap on the first activity alert
    Then I am redirected to the standalone view of the first activity alert
    And I navigate back using device back button
    Then I sign out to clear the device