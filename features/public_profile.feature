@applitools
Feature: Public Profile

  Background:
    Given I sign in to use the app
    When I tap on the "my br" icon tab
    When I tap on the "find friends" icon from toolbar menu
    Then I tap on the "search for friends" icon from toolbar menu

  @TEST_BRUTE-281
  Scenario: Public Profile UI
    Then I am able to search for friends by "username"
    And I tap on the search username results
    When I tap on the follow button
    Then the "Public Profile - Unfollowed User" screen is displayed
    When I tap on the follow button
    Then the "Public Profile - Followed User" screen is displayed
    When I tap on the overflow menu
    Then the "Public Profile - More Options" screen is displayed

  @TEST_BRUTE-282
  Scenario: Public Profile - Verified User
    Then I am able to search for friends by "verified user"
    And I tap on the search username results
    And the "Public Profile - Verified User" screen is displayed

  @TEST_BRUTE-283
  Scenario: Public Profile - Suspended User
    Then I am able to search for friends by "suspended user"
    And I tap on the search username results
    And the "Public Profile - Suspended User" screen is displayed
