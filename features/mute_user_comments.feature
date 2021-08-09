@FIXME_ANDROID-2641
Feature: Mute User - Comments

  Background:
    Given I sign in to use the app
    And I tap on the "search" icon from toolbar menu
    Then I use the menu to search for "Vincent Edwards"
    Then I tap on the "comment" icon from the article

  Scenario: Mute User from Comments
    And I decide to "Block User" from comments
    Then a confirmation dialogue that a user is "blocked" is shown
    And I tap on the navigate back button
    Then I sign out to clear the device

  Scenario: Unmute User from Comments
    When I decide to "Unblock User" from comments
    Then a confirmation dialogue that a user is "unblocked" is not shown
    And I tap on the navigate back button
    Then I sign out to clear the device