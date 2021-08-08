Feature: Sign In - Phone

  Background:
    Given I decide to sign in with "phone"

  @applitools
  Scenario: Verify Sign In - Phone screen UI
    Then the "Log In With Your Phone" screen is displayed

  @regression
  Scenario: Verify Valid Phone Credentials Functionality
    When I provide a "valid" phone "+14157354863"
    And I tap on the "continue" button
    Then User should get "4157354863" text summary displayed

  @regression
  Scenario: Verify Invalid Phone Credentials Functionality
    When I provide a "invalid" phone "+10000000000"
    And I tap on the "continue" button
    Then the textview "not found" is displayed