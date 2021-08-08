@QA-2003_update_to_use_username_search @FIXME_ANDROID-2641
Feature: Mute User - Profile

  Background:
    Given I sign in to use the app
    And the "Find Out Who You Know on B/R" social promo is "shown"
    And I tap on the "search" icon from toolbar menu
    Then I use the menu to search for "Lionel Messi"
    Then I tap on the "comment" icon from the article
    And I tap on a "user logo" in the reaction list
    Then I am redirected to the users full screen profile

  Scenario: Verify mute User from a Profile UI and Functionality
    And I decide to "Block User" from profile
    Then a confirmation banner that a user is "blocked" is shown

  Scenario: Verify unmute User from a Profile UI and Functionality
    When I decide to "Unblock User" from profile
    Then a confirmation banner that a user is "unblocked" is not shown