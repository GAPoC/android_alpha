@applitools @TEST_QA-7507
Feature: Scores - Olympic Basketball

  Background:
    Given I navigate to the "scores" tab
    When I tap on the "Olympic BB" scores tab picker

  Scenario: Verify Olympic Basketball Tab UI
    Then the "Olympic BB" scores screen is displayed

  Scenario: Verify Olympic Basketball Completed Gamecast UI
    Then I tap on the previous game date
    And I view a "completed" gamecast
    Then the "Olympic BB COMPLETED - RECAP" scores screen is displayed
    And I verify betting link is displayed
    And I tap on "STATS" textview
    Then the "Olympic BB COMPLETED - STATS" scores screen is displayed
    And I tap on "PLAYS" textview
    Then the "Olympic BB COMPLETED - PLAYS" scores screen is displayed
    And I tap on "ODDS" textview
    Then the "Olympic BB COMPLETED - ODDS" scores screen is displayed

  Scenario: Verify Olympic Basketball Upcoming Gamecast UI
    Then I tap on the future game date
    And I view a "upcoming" gamecast
    Then the "Olympic BB UPCOMING - PREVIEW" scores upcoming screen is displayed

  Scenario: Verify Olympic Basketball Live Gamecast UI
    Then a live "Olympic BB" game is inprogress