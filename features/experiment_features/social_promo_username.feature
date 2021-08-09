@experiment
Feature: Social Promo - Create a Username

  Scenario: Verify The Create Username - Sign In Flow
    Given I navigate to the "home" tab
    Then the "username" social promo is "shown" in the home stream
    When I tap on the "Sign In" button
    Then I am redirected to the "sign in" screen
    When I tap on the navigate back button
    And I am redirected to choose my team

  Scenario: Verify The Create Username - Creating a New Username Flow
    Given I navigate to the "home" tab
    Then the "username" social promo is "shown" in the home stream
    When I choose a "new" username for my account
    And I tap on the "Continue" button
    When I tap on the navigate back button
    Then I am redirected to the "Name" screen

    @ErrorMsgBug_ABWB-201
  Scenario: Verify The Create Username - Using an Existing Username Flow
    Given I navigate to the "home" tab
    Then the "username" social promo is "shown" in the home stream
    When I choose a "existing" username for my account
    And I tap on the "Continue" button
    Then the textview ".*" is displayed

  Scenario: Verify Create Username - User is Already Signed In
    Given I sign in to use the app
    When I navigate to the "home" tab
    Then the "username" social promo is "not shown" in the home stream
    Then I sign out to clear the device