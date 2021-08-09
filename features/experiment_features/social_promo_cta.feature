@experiment
Feature: Social Promo - Call-To-Action Promo

  Scenario: Verify CTA In-Stream Module Flow - Signed In
    Given I navigate to the "home" tab
    Then the "call-to-action" social promo is "shown" in the home stream
    When I tap on the "Create Your account" button
    Then I am redirected to the "Name" screen
    Then I tap on the navigate back button
    And I tap on the "Sign In" button
    Then I am redirected to the "Sign In" screen

  Scenario: Verify CTA In-Stream Module Flow - Signed Out
    Given I sign in to use the app
    When I navigate to the "home" tab
    Then the "call-to-action" social promo is "not shown" in the home stream
    Then I sign out to clear the device