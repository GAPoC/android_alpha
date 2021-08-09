@ready_for_regression_JWB-1213
Feature: Geo target betting link

  @TEST_QA-6791
  Scenario: Verify the betting links for IL location
    Given I launch the app from "US-IL" region
    When I navigate to the "scores" tab
    Then the textview "Bet now on" is displayed
    And I scroll down till disclaimer text
    Then I verify the disclaimer text

  @TEST_QA-6859
  Scenario: Verify the betting links for UK location
    Given I launch the app from "UK-DE" region
    When I navigate to the "scores" tab
    Then I verify betting link is not displayed

  @TEST_QA-6791
  Scenario: Verify the betting links for IL location in gamecast
    Given I launch the app from "US-IL" region
    When I navigate to the "scores" tab
    Then I tap on the previous game date
    And I view a "completed" gamecast
    Then the textview "Bet now on" is displayed

  @TEST_QA-6791
  Scenario: Verify the bet now button for IL location in odds tab
    Given I launch the app from "US-IL" region
    When I navigate to the "scores" tab
    Then I tap on the future game date
    And I view a "upcoming" gamecast
    Then I scroll down to verify odds partner label
    Then I scroll down to verify odds_bet_now button