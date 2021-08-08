Feature: Scores - College BB

  Background:
    Given I navigate to the "scores" tab
    When I tap on the "College BB" scores tab picker

  @Test_QA-6835 @applitools
  Scenario: Verify College BB Completed Gamecast UI for odds tab
    Then I tap on the previous game date
    And I view a "completed" gamecast
    Then the textview "RECAP" is displayed
    And I tap on "ODDS" textview
    Then the "College BB COMPLETED - ODDS" scores screen is displayed
    Then I scroll down to verify odds partner label
    Then I scroll down to verify no_bet_play_now button
    Then I scroll down till disclaimer text
    Then I verify the disclaimer text

  @Test_QA-6835 @no_game
  Scenario: Verify College BB Upcoming Gamecast UI for odds label
    Then I tap on the future game date
    And I view a "upcoming" gamecast
    Then I scroll down to verify odds partner label
    Then I scroll down to verify bet_play_now button

  @TEST_QA-7802 @ready_for_regression
  Scenario: Verify CBB odds UI validation on the gamecast track
    Then I tap on the previous game date
    And I view a "completed" gamecast
    Then  I tap on the teamstream
    And I scroll down "1" time
    Then I scroll till "Full Recap & Highlights" text in the Stream
    Then I scroll down to verify odds partner label