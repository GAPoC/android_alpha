@fixme
Feature: Sign In - Facebook

  Scenario: Valid FB Credentials
    Given I decide to sign in with "facebook"
    When I provide a "valid facebook" email
    And I provide a "valid facebook" password
    And I tap on the facebook login button
    And I tap on the facebook continue button
    Then the user is redirected to the home screen
    Then I sign out to clear the device