@regression
Feature: User Bio

  Background:
    Given I sign in to use the app
    When I tap on the "settings" icon from toolbar menu
    Then I tap on "My Profile" textview
    And I tap on the "User Bio" profile option

  Scenario: Add User Bio from My Profile Functionality
    Then I am redirected to the "Edit Bio" screen
    When I provide a user bio to my profile
    And I tap on the "action done" button
    Then I am redirected to the "My Profile" screen
    And the user bio is shown in my profile
    And I navigate back using device back button
    Then I sign out to clear the device

  Scenario: Verify more than 160 Characters Functionality
    When I provide a user bio thats "161" characters
    Then the done button is "disabled" from the user bio
    When I provide a user bio thats "160" characters
    Then the done button is "enabled" from the user bio
    And I tap on the navigate back button
    And I choose "YES" from alert settings
    And I navigate back using device back button
    Then I sign out to clear the device