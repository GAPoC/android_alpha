@applitools
Feature: Scores - NFL

  Background:
    Given I navigate to the "scores" tab
    When I tap on the "NFL" scores tab picker

  @TEST_QA-7554
  Scenario: Verify NFL Tab UI
    Then the "NFL" scores screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    And I verify the disclaimer text

  @TEST_QA-5476
  Scenario: Verify NFL Completed Gamecast UI
    Then I tap on the previous game date
    And I view a "completed" gamecast
    Then the "NFL COMPLETED - RECAP" scores screen is displayed
    And I verify betting link is displayed
    And I tap on "STATS" tab
    Then the "NFL COMPLETED - STATS" scores screen is displayed
    And I tap on "PLAYS" tab
    Then the "NFL COMPLETED - PLAYS" scores screen is displayed
    And I tap on ODDS tab in the gamecast

  @TEST_QA-7557
  Scenario: Verify NFL Upcoming Gamecast UI
    Then I tap on the future game date
    And I view a "upcoming" gamecast
    Then the "NFL UPCOMING - PREVIEW" scores upcoming screen is displayed
    And I verify betting link is displayed

  @TEST_QA-7568
  Scenario: Verify NFL Live Gamecast UI
    Then a live "NFL" game is inprogress