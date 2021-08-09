Feature: Create Account - Stepper Flow - MY BR

  @failing
  Scenario: Verify My BR Stepper Flow Functionality
    Given I navigate to the "my br" tab
    When I tap on the "Complete Next Step" button
    When I tap on the "Continue with Phone" button
    And I provide my first name
    And I provide my last name
    And I tap on the "Continue" button
    Then the "Choose a Username" screen is displayed
    And I choose a "valid" username for my account
    And I tap on the "continue" button
    Then the "Sign Up with Your Phone" screen is displayed
    And I tap on the sign up with facebook or email link
    Then the "Sign Up with Google or Facebook" screen is displayed