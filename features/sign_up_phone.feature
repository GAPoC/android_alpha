@regression
Feature: Sign Up - Phone

  Scenario: Verify Create Account with Invalid Phone Number Functionality
    Given I decide to sign up for an account
    When I provide my first name
    And I provide my last name
    And I tap on the "continue" button
    Then I choose a "valid" username for my account
    And I tap on the "continue" button
    When I provide a "valid" phone "+14157354863"
    And I tap on the "send code" button
    Then User should get "That phone number is already taken." text status displayed