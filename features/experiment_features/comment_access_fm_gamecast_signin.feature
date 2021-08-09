@posponed_games
Feature: Commentary Access from Gamecasts - Sign In

  Background:
    Given I sign in to use the app
    And I tap on "Scores" textview
    And I tap on the "NBA" scores tab picker
    Then I tap on the previous game date
    And I view a "completed" gamecast

  Scenario: Verify that user can go to the commentary from the Gamecast and navigate back
    Then the textview Gamecast comments displayed
    And I tap on Gamecast comments textview
    Then the "Commentary from Gamecast Sign In" screen is displayed
    And I tap on the navigate back button
    Then the "NBA COMPLETED - RECAP" scores screen is displayed