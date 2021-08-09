@regression @BTEAM-1151
Feature: Direct Message - Name A Chat

  Scenario: Verify Changing a Chat Name Functionality
    Given I sign in to use the app
    And I tap on the "home" icon tab
    And I tap on the "dm inbox" icon from toolbar menu
    And I tap on "Used by automation" textview
    And I tap the "chat details" button from DM
    When I change the chat name to "Nazi"
    Then the textview "Name is not allowed" is displayed
    And I change the chat name to "Test Chat"
    And I navigate back using device back button
    And the textview "Test Chat" is displayed
    And the textview "veruca_salt changed the chat name to Test Chat" is displayed
    And I tap the "chat details" button from DM
    And I change the chat name to "Used by automation"
    And I navigate back using device back button
    And I navigate back using device back button
    And I navigate back using device back button
    And I sign out to clear the device

