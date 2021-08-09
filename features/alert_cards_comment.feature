@regression
Feature: Alert Cards - Comment Icon

 Scenario: Tapping Comment - Signed Out UI
    Given I navigate to the "alerts" tab
    And I tap on the "comment" icon from the alert

  Scenario: Tapping Comment - Signed In
    Given I sign in to use the app
    And I tap on the "alerts" icon tab
    And I tap on the "comment" icon from the alert
    Then the article "commentary" title is displayed
    And I navigate back using device back button
    Then I sign out to clear the device