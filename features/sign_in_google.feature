@applitools
Feature: Sign In - Google

  Scenario: Verify signing in with google
    Given I decide to sign in with "gmail"
    Then the user is redirected to the google login screen