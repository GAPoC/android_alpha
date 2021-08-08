@deprecated
Feature: Sign Up - Email

  Scenario: Create Account with Email
    Given I decide to sign up for an account
    Then the "Whats Your Name" screen is displayed
    When I provide my first name
    And I provide my last name
    And I tap on the "Continue" button
    Then the "Choose a Username" screen is displayed
    And I choose a "valid" username for my account
    And I tap on the "continue" button
    Then the "Sign Up with Your Phone" screen is displayed
    And I tap on the sign up with facebook or email link
    Then the "Sign Up with Google, Facebook, or Email" screen is displayed
    And I tap on the Sign up with email button
    Then the "Sign Up with Email" screen is displayed
    And I provide my email to sign up
    And I provide my password to sign up
    Then I tap on the "Hide Keyboard" button
    And I tap on the "Continue" button
    And I tap on the "action done" button
    And I tap on "Next" textview
    And I "allow" the alert permission
    Then I navigate back using device back button
    Then I navigate back using device back button
    And I tap on "Skip" textview
    Then the textview "My Profile" is displayed