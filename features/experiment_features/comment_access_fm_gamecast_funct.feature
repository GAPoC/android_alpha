Feature: Commentary Access from Gamecasts page Functionality

  Background:
    Given I sign in to use the app
    And I tap on "Scores" textview
    Then I tap on the "Skip" button
    And I tap on the "NBA" scores tab picker
    Then I tap on the previous game date
    And I view a "completed" gamecast

  @ready_need_teststream
  Scenario: Verify that Signed in Users can leave a comment
    Then I tap on Gamecast comments textview
    And I tap into the "Say something…" textfield
    Then I add a comment to the "gamecast" comment
    And I verify that my comment on top of the Commens list

  @posponed_games
  Scenario: Verify that comments sorted by recent and sort can be changed
    And I tap on Gamecast comments textview
    Then the textview "NEWEST" is displayed
    And I tap on the Sort Comments button
    Then I sort to the "Oldest" comments via sort "button"
    And the "Commentary sorted by Oldest" scores screen is displayed
    And I tap on the Sort Comments button
    Then I sort to the "Most 🔥" comments via sort "button"
    And the "Commentary sorted by Most Hottest" screen is displayed

  @posponed_games
  Scenario: Verify that comments sort can be changed from menu
    And I tap on Gamecast comments textview
    And I tap on the Menu Sort button
    Then I sort to the "Oldest" comments via sort "button"
    And the "Commentary sorted by Oldest" scores screen is displayed
    And I tap on the Menu Sort button
    Then I sort to the "Most 🔥" comments via sort "button"
    And the "Commentary sorted by Most Hottest" screen is displayed

  @fixme
  Scenario: Verify that no commentary access due to posponed games
    And I verify that POSTPONED status for game exist
    Then the "Preview POSTPONED" screen is displayed

