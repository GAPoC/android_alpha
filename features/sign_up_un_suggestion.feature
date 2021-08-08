@applitools
Feature: Sign Up - Username Suggestion

  Scenario: Verify username suggestion option is shown
    Given I decide to sign up for an account
    When I provide my first name
    And I provide my last name
    And I tap on the "Continue" button
    And I tap on the "Continue" button
    And I choose a "existing" username for my account
    Then the "User Suggestion" screen is displayed