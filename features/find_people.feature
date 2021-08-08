@regression
Feature: Find People

  Background:
    Given I sign in to use the app
    Then I tap on the "my br" icon tab
    And I tap on the "edit profile" button

  Scenario: Search By Username
    When I tap on the "Search for Friends" profile option
    Then I am able to search for friends by "username"
    And I tap on the navigate back button
    And I tap on the navigate back button
    Then I sign out to clear the device

  Scenario: Allow Contacts
    When I scroll to "Contacts"
    And I tap on the "Contacts" profile option
    Then the "Find Friends" screen is displayed
    And I navigate back using device back button
    And I navigate back using device back button
    Then I sign out to clear the device

  Scenario: Facebook
    When I tap on the "Facebook" profile option
    Then the "Facebook" screen is displayed
    And I navigate back using device back button
    And I tap on the navigate back button
    Then I sign out to clear the device