@applitools
Feature: Scores - College FB

  Background:
    Given I navigate to the "scores" tab
    When I tap on the "College FB" scores tab picker

  @TEST_QA-7548
  Scenario: Verify College FB Tab UI
    Then the "College FB" scores screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    And I verify the disclaimer text

  @TEST_QA-5477
  Scenario: Verify College FB Completed Gamecast UI
    Then I tap on the previous game date
    And I view a "completed" gamecast
    Then the "College FB COMPLETED - RECAP" scores screen is displayed
    And I verify betting link is displayed
    And I tap on "STATS" textview
    Then the "College FB COMPLETED - STATS" scores screen is displayed
    And I tap on "PLAYS" textview
    Then the "College FB COMPLETED - PLAYS" scores screen is displayed
    And I tap on ODDS tab in the gamecast

  @TEST_QA-7547
  Scenario: Verify College FB Upcoming Gamecast UI
    Then I tap on the future game date
    And I view a "upcoming" gamecast
    Then the "College FB UPCOMING - PREVIEW" scores upcoming screen is displayed
    And I verify betting link is displayed

  @TEST_QA-7565
  Scenario: Verify College FB Live Gamecast UI
    Then a live "College FB" game is inprogress