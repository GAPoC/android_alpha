@applitools
Feature: Scores - Soccer

  Background:
    Given I navigate to the "scores" tab
    When I tap on the "Soccer" scores tab picker

 @TEST_QA-4018
  Scenario: Verify Soccer FB Tab UI
    Then the "Soccer" scores screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    And I verify the disclaimer text

  @TEST_QA-5480
  Scenario: Verify Soccer Completed Gamecast UI
    Then I tap on the previous game date
    And I view a "completed" soccer gamecast
    Then the "Soccer COMPLETED - RECAP" scores screen is displayed
    And I verify betting link is displayed
    And I tap on "LINEUPS" tab
    Then the "Soccer COMPLETED - LINEUPS" scores screen is displayed
    And I tap on "STATS" tab
    Then the "Soccer COMPLETED - STATS" scores screen is displayed
    And I tap on soccer TABLE textview
    Then the "Soccer COMPLETED - TABLE" scores screen is displayed

  @TEST_QA-7560 @QA-7062
  Scenario: Verify Soccer Upcoming Gamecast UI
    Then I tap on the future game date
    And I view a "upcoming" gamecast
    Then the "Soccer UPCOMING - PREVIEW" scores upcoming screen is displayed
    And I verify betting link is displayed
    Then I scroll down to verify odds partner label
    Then I verify the disclaimer text

  @TEST_QA-7570
  Scenario: Verify Soccer Live Gamecast UI
    Then a live "Soccer" game is inprogress