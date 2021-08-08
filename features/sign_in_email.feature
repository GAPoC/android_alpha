Feature: Sign In - Email

  Background:
    Given I decide to sign in with "email"

  @applitools
  Scenario: Valid Email Credentials
    When I provide a "valid" email
    And I provide a "valid" password
    And I tap on the "continue" button
    And the home feed screen is displayed
    Then I sign out to clear the device

  @regression
  Scenario: Invalid Email Credentials
    When I provide a "invalid" email
    And I provide a "invalid" password
    And I tap on the "continue" button
    Then User should get "Invalid username and password. Please try again." text status displayed

  @regression
  Scenario: Verify sign in flow when tapping Back
    When I tap on the navigate back button
    Then I am redirected to the "Sign In" screen