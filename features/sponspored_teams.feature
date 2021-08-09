@regression
Feature: Sponsored Teams

  Scenario: Verify Sponsored Teams Functionality
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    When I tap on the add button from my teams
    Then I search for "Heisman Watch"
    And I tap on the "done" button
    And I scroll to "The Climb"
    Then the textview "The Climb" is displayed
    And I scroll to "Heisman Watch"
    Then the textview "Heisman Watch" is displayed
    When I tap on "Heisman Watch" textview
    Then the textview "Heisman Watch" is displayed
    Then I sign out to clear the device