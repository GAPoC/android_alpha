@applitools
Feature: Direct Message - Add to Chat

  Scenario: Verify Add to Chat UI
    Given I sign in to use the app
    And I tap on the "home" icon tab
    And I tap on the "dm inbox" icon from toolbar menu
    And I tap on "Used by automation" textview
    And I tap the "chat details" button from DM
    When I tap the "add member" button from DM
    And I search for my friend "jumbojoefan2"
    And I tap on "jumbojoefan2" textview
    Then the "Add People to chat" screen is displayed
    And I navigate back using device back button
    And I navigate back using device back button
    And I navigate back using device back button
    And I navigate back using device back button
    And I sign out to clear the device