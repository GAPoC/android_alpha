Feature: Forgot Password

  Background:
    Given I forgot my password

  @applitools
  Scenario: Verify Forgot Password UI
    Then the "Reset Password" screen is displayed

  @OBO-130
  Scenario: Verify Invalid Email Error UI
    When I provide a "invalid format" email
    And I tap on the "continue" button
    Then the "Email is invalid, try again" screen is displayed

   @need_applitools
  Scenario: Verify Forgot Password Functionality & UI
    When I provide a "valid" email
    And I tap on the "continue" button
    Then the "Check Your Email Toast" screen is displayed
    Then the textview "Check your email for reset code" is displayed