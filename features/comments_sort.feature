@experiment @FIXME_ANDROID-2641
Feature: Comments Sorting

  Background:
    Given I sign in to use the app
    When I tap on the "home" icon tab
    Then I tap on the "search" icon from toolbar menu
    And the "Find Out Who You Know on B/R" social promo is "shown"
    Then I use the menu to search for "Game of Zones"
    And I tap on the "comment" icon from the article

  Scenario: Sorting a Comment via the Sort Label
    And I sort to the "Most 🔥" comments via sort "label"
    Then the "MOST REACTED" comments are shown
    When I sort to the "Oldest" comments via sort "label"
    Then the "OLDEST" comments are shown
    And I sort to the "Newest" comments via sort "label"
    Then the "NEWEST" comments are shown
    And I tap on the navigate back button
    And I navigate back using device back button
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    Then I sign out to clear the device

  Scenario: Verify Sorting a Comment via the Caret Button
    When I sort to the "Oldest" comments via sort "caret"
    Then the "OLDEST" comments are shown
    And I sort to the "Newest" comments via sort "caret"
    Then the "NEWEST" comments are shown
    And I sort to the "Most 🔥" comments via sort "caret"
    Then the "MOST REACTED" comments are shown
    And I tap on the navigate back button
    And I tap on the navigate back button
    And I tap on the navigate back button
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    Then I sign out to clear the device