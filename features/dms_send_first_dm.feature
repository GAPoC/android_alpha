@applitools @BTEAM-1153
Feature: Direct Message - Send Your First DM

  Scenario: DMs - Verify Send Your First DM UI
    Given I decide to sign in with "email"
    And I provide a "noDM" email
    And I provide a "noDM" password
    And I tap on the "Continue" button
    When I tap on the "dm inbox" icon from toolbar menu
    Then the "Send A Message Modal" screen is displayed
    And I tap the "send message" button from DM
    Then I am redirected to the "New Message" screen
    And the "New Message" screen is displayed
    And I tap on the navigate back button
    And I sign out to clear the device