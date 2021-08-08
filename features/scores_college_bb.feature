Feature: Scores - College BB

  Background:
    Given I navigate to the "scores" tab
    When I tap on the "College BB" scores tab picker

  @applitools @TEST_QA-7516
  Scenario: Verify College BB Tab UI
    Then the "College BB" scores screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    And I verify the disclaimer text

  @applitools @TEST_QA-5475
  Scenario: Verify College BB Completed Gamecast UI
    Then I tap on the previous game date
    And I view a "completed" gamecast
    Then the "College BB COMPLETED - RECAP" scores screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    And I verify the disclaimer text
    And I tap on "STATS" textview
    Then the "College BB COMPLETED - STATS" scores screen is displayed
    And I tap on "PLAYS" textview
    Then the "College BB COMPLETED - PLAYS" scores screen is displayed

  @TEST_QA-7546 @no_game
  Scenario: Verify College BB Upcoming Gamecast UI
    Then I tap on the future game date
    And I view a "upcoming" gamecast
    Then the "College BB - PREVIEW" scores upcoming screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    Then I verify the disclaimer text

  @applitools @TEST_QA-7564
  Scenario: Verify College BB Live Gamecast UI
    Then a live "College BB" game is inprogress