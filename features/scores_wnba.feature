@applitools
Feature: Scores - WNBA

  Background:
    Given I navigate to the "scores" tab
    When I tap on the "WNBA" scores tab picker

  Scenario: Verify WNBA Tab UI
    Then the "WNBA" scores screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    And I verify the disclaimer text

  Scenario: Verify WNBA Completed Gamecast UI
    Then I tap on the previous game date
    And I view a "completed" gamecast
    Then the "WNBA COMPLETED - RECAP" scores screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    And I verify the disclaimer text
    And I tap on "STATS" tab
    Then the "WNBA COMPLETED - STATS" scores screen is displayed
    And I tap on "PLAYS" tab
    Then the "WNBA COMPLETED - PLAYS" scores screen is displayed

  Scenario: Verify WNBA Upcoming Gamecast UI
    Then I tap on the future game date
    And I view a "upcoming" gamecast
    Then the "WNBA UPCOMING - PREVIEW" scores upcoming screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    Then I verify the disclaimer text

  Scenario: Verify WNBA Live Gamecast UI
    Then a live "WNBA" game is inprogress