Feature: Scores - NHL

  Background:
    Given I navigate to the "scores" tab
    When I tap on the "NHL" scores tab picker

  @TEST_QA-6833 @applitools
  Scenario: Verify NHL Completed Gamecast UI for odds tab
    Then I tap on the previous game date
    And I view a "completed" gamecast
    Then the textview "RECAP" is displayed
    And I tap on "ODDS" tab
    Then the "NHL COMPLETED - ODDS" scores screen is displayed
    Then I scroll down to verify odds partner label
    Then I scroll down to verify no_bet_play_now button
    Then I scroll down till disclaimer text
    Then I verify the disclaimer text

  @TEST_QA-6833 @no_game
  Scenario: Verify NHL Upcoming Gamecast UI for odds label
    Then I tap on the future game date
    And I view a "upcoming" gamecast
    Then I scroll down to verify odds partner label
    Then I scroll down to verify bet_play_now button

  @TEST_QA-7800 @ready_for_regression
  Scenario: Verify NHL odds UI validation on the gamecast track
    Then I tap on the previous game date
    And I view a "completed" gamecast
    Then I tap on the teamstream
    And I scroll down "1" time
    Then I scroll till "Full Recap & Highlights" text in the Stream
    Then I scroll down to verify odds partner label