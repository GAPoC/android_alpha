Feature: Bet Center - How to Play

  Background:
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    Then I tap on Perfect Picks icon
    Then I tap on the How To Play button

  @applitools @applitools_betting @TEST_QA-3576
  Scenario: Verify How the Game works on Bet center
    And the "How the Game Works" screen is displayed
    And I tap on "Got It" textview
    And I verify that Perfect Picks screen is the current screen
    Then I sign out to clear the device

  @applitools @applitools_betting @TEST_QA-3557
  Scenario: Verify Prizes page
    Then I tap on "See Game Rules and Prizes" textview
    And the "Prize Details" screen is displayed
    And I tap on "Follow B/R Betting" textview
    And I tap on "Go to B/R Betting" textview
    And the "B/R Betting stream" screen is displayed
    And I tap on the navigate back button
    And I tap on the navigate back button
    And I verify that Perfect Picks screen is the current screen
    Then I sign out to clear the device

  @regression @betting @TEST_QA-3450
  Scenario: Verify Official Rules
    Then I tap on "See Game Rules and Prizes" textview
    And I scroll to "See Official Rules for details"
    And I verify the Official Rules details
    Then I sign out to clear the device