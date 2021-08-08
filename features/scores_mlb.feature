@applitools
Feature: Scores - MLB Gamecast

  Background:
    Given I navigate to the "scores" tab
    When I tap on the "MLB" scores tab picker

  @TEST_QA-7550
  Scenario: Verify MLB Tab UI
    Then the "MLB" scores screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    And I verify the disclaimer text

  @TEST_QA-5471 @TEST_QA_7664
  Scenario: Verify MLB Completed Gamecast UI
    Then I tap on the previous game date
    And I view a "completed" gamecast
    Then the "MLB COMPLETED - RECAP" scores screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    And I verify the disclaimer text
    And I tap on "BOXSCORE" textview
    Then the "MLB COMPLETED - BOXSCORE" scores screen is displayed
    And I tap on "PLAYS" textview
    Then the "MLB COMPLETED - PLAYS" scores screen is displayed

  @TEST_QA-7664
  Scenario: Verify MLB Upcoming Gamecast UI
    Then I tap on the future game date
    And I view a "upcoming" gamecast
    Then the "MLB UPCOMING - PREVIEW" scores upcoming screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    Then I verify the disclaimer text

  @TEST_QA-7566
  Scenario: Verify MLB Live Gamecast UI
    Then a live "MLB" game is inprogress