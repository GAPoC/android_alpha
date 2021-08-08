@regression
Feature: Create Account - Stepper Flow

  Scenario: Verify Sign In Stepper Flow Functionality
    Given I navigate to the "my br" tab
    When I tap on the "Complete Next Step" button
    And I tap on the "Already have an account? Log In" button
    And I tap on the "Log in with Phone or Email" button
    And I hide the keyboard
    And I tap on the Log in with Email button
    And I provide a "valid" email
    And I provide a "valid" password
    And I tap on the "continue" button
    Then I am redirected to the "my br" screen