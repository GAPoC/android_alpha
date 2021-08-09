Feature: Scores - NHL

  Background:
    Given I navigate to the "scores" tab
    When I tap on the "NHL" scores tab picker

  @applitools @TEST_QA-7556
  Scenario: Verify NHL Tab UI
    Then the "NHL" scores screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    And I verify the disclaimer text

  @applitools @TEST_QA-5478
  Scenario: Verify NHL Completed Gamecast UI
    Then I tap on the previous game date
    And I view a "completed" gamecast
    Then the "NHL COMPLETED - RECAP" scores screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    And I verify the disclaimer text
    And I tap on "STATS" tab
    Then the "NHL COMPLETED - STATS" scores screen is displayed
    And I tap on "PLAYS" tab
    Then the "NHL COMPLETED - PLAYS" scores screen is displayed

  @no_game @TEST_QA-7553 @QA-6833
  Scenario: Verify NHL Upcoming Gamecast UI
    Then I tap on the future game date
    And I view a "upcoming" gamecast
    Then the "NHL UPCOMING - PREVIEW" scores upcoming screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    Then I verify the disclaimer text

  @applitools @TEST_QA-7569
  Scenario: Verify NHL Live Gamecast UI
    Then a live "NHL" game is inprogress