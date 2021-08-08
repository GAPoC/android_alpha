@regression
Feature: Comments Sorting - Gamecast

  Background:
    Given I sign in to use the app
    When I tap on the "scores" icon tab
    And I tap on the previous game date
    And I view a "completed" gamecast

  Scenario: Verify default sort for Gamecast tracks
    And I tap on Gamecast comments textview
    When I sort to the "Oldest" comments via sort "button"
    Then the "OLDEST" comments are shown
    And I sort to the "Newest" comments via sort "caret"
    Then the "NEWEST" comments are shown
    And I sort to the "Most 🔥" comments via sort "caret"
    Then the "MOST REACTED" comments are shown
    And I tap on the navigate back button
    And I tap on the navigate back button
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    Then I sign out to clear the device

  Scenario: Verify default sort for Stream Gamecast tracks
    And I tap on Team name
    And I scroll till "Full Recap & Highlights" text in the Stream
    And I tap on full recap and highlights
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    And I tap on Gamecast comments textview
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