@regression
Feature: Find Friends - Following Flow

  Background:
    Given I sign in to use the app
    When I tap on the "my br" icon tab

  Scenario: Tapping on Find Friends from Following List
    And I tap on "Following" textview
    And I tap on the "invite" button
    Then I am redirected to the "Find Friends" screen
    Then I tap on "Done" textview
    And I tap on the navigate back button
    Then I am redirected to the "my br" screen
    Then I sign out to clear the device