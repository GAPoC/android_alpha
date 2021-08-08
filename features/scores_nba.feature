@applitools
Feature: Scores - NBA

  Background:
    Given I navigate to the "scores" tab
    When I tap on the "NBA" scores tab picker

  @TEST_QA-7552
  Scenario: Verify NBA Tab UI
    Then the "NBA" scores screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    And I verify the disclaimer text

  @TEST_QA-7498
  Scenario: Verify NBA Completed Gamecast UI
    Then I tap on the previous game date
    And I view a "completed" gamecast
    Then the "NBA COMPLETED - RECAP" scores screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    And I verify the disclaimer text
    And I tap on "STATS" tab
    Then the "NBA COMPLETED - STATS" scores screen is displayed
    And I tap on "PLAYS" tab
    Then the "NBA COMPLETED - PLAYS" scores screen is displayed

  @TEST_QA-7551 @no_game
  Scenario: Verify NBA Upcoming Gamecast UI
    Then I tap on the future game date
    And I view a "upcoming" gamecast
    Then the "NBA UPCOMING - PREVIEW" scores upcoming screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    Then I verify the disclaimer text

  @TEST_QA-7567
  Scenario: Verify NBA Live Gamecast UI
    Then a live "NBA" game is inprogress