@regression
Feature: Scores - Golf

  Background:
    Given I navigate to the "scores" tab
    When I tap on the "Golf" scores tab picker

  Scenario: Verify Golf Tab UI for Today Games
    Then the "Golf" scores screen is displayed
    And I verify betting link is displayed
    Then I scroll down till disclaimer text
    And I verify the disclaimer text

  @TEST_QA-6936 @TEST_QA-6648
  Scenario: Verify Golf Completed Game
    Then I tap on the previous game date
    Then the "GOLF COMPLETED GAME" scores screen is displayed
    And I verify betting link is displayed
    When I tap on the golf team name
    And I am redirected to the "Golf News" screen
    Then I tap on the navigate back button
    Then I scroll down till disclaimer text
    And I verify the disclaimer text

  @TEST_QA-6936 @TEST_QA-6645
  Scenario: Verify Golf Upcoming Game
    Then I tap on the future game date
    Then the "GOLF FUTURE GAME" scores screen is displayed
    And I verify betting link is displayed
    When I tap on the golf team name
    And I am redirected to the "Golf News" screen
    Then I tap on the navigate back button
    Then I scroll down till disclaimer text
    And I verify the disclaimer text