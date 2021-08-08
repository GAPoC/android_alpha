@posponed_games
Feature: Commentary Access from Gamecasts - No Sign In

  Background:
    Given I navigate to the "scores" tab
    And I tap on the "NBA" scores tab picker
    Then I tap on the previous game date
    And I view a "completed" gamecast

  Scenario: Verify that  not signed user cannot see the commentary from the Gamecast
    Then the textview Gamecast comments displayed
    And I tap on Gamecast comments textview
    Then the "Commentary from Gamecast No Sign In" screen is displayed

  Scenario: Verify that not signed user can Sign In from commentary from the Gamecast
    Then the textview Gamecast comments displayed
    And I tap on Gamecast comments textview
    Then I tap on the "Sign In" button on pop up
    Then the "Sign In" screen is displayed

  Scenario: Verify that not signed user can Create Username from commentary from the Gamecast
    Then the textview Gamecast comments displayed
    And I tap on Gamecast comments textview
    Then I tap on the "Create Username" button on pop up
    Then the "Create account" screen is displayed




