@experiment
Feature: Social Promo - Contacts & Invites

  Scenario: Verify Contacts Promo Module - Allow Contacts
    Given I sign in to use the app
    Then the "add contacts" social promo is "shown" in the home stream
    When I tap on the "Add Your Contacts" button
    Then I "allow" the alert permission
    Then I am redirected to the "Contacts" screen
    When I tap on the navigate back button
    Then I am redirected to the "home" screen
    Then I sign out to clear the device

  Scenario: Verify Contacts Promo Module - Deny Contacts

    Given I sign in to use the app
    Then the "add contacts" social promo is "shown" in the home stream
    When I tap on the "Add Your Contacts" button
    And I "deny" the alert permission
    Then the "invite" social promo is "shown" in the home stream
    Then I sign out to clear the device