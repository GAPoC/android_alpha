Feature: Scores - MLB odds

  Background:
    Given I navigate to the "scores" tab
    When I tap on the "MLB" scores tab picker

  @TEST_QA-7650 @applitools
  Scenario: Verify MLB Completed Gamecast UI for odds tab
    Then I tap on the previous game date
    And I view a "completed" gamecast
    Then the textview "RECAP" is displayed
    And I tap on "ODDS" textview
    Then the "MLB COMPLETED - ODDS" scores screen is displayed
    Then I scroll down to verify odds partner label
    Then I scroll down to verify no_bet_play_now button
    Then I scroll down till disclaimer text
    Then I verify the disclaimer text

  @TEST_QA-7650 @regression
  Scenario: Verify MLB Upcoming Gamecast UI for odds label
    Then I tap on the future game date
    And I view a "upcoming" gamecast
    Then I scroll down to verify odds partner label
    Then I scroll down to verify bet_play_now button

  @TEST_QA-7793 @ready_for_regression
   Scenario: Verify MLB odds UI validation on the gamecast track
     Then I tap on the previous game date
     And I view a "completed" gamecast
     Then  I tap on the teamstream
     And I scroll down "1" time
     Then I scroll till "Full Recap & Highlights" text in the Stream
     Then I scroll down to verify odds partner label