@regression
Feature: Betting Link - Top Games

  Background:
    Given I navigate to the "scores" tab

  Scenario: Verify Top Games Betting Link
    Then the "Top Games" scores screen is displayed
    And I tap on betting link
    Then I navigate back using device back button
    Then I scroll down till disclaimer text
    And I verify the disclaimer text

  Scenario: Verify Gamecast Betting Link from completed games
    Then I launch the gamecast betting link track
    And I tap on betting link
    Then I navigate back using device back button
    Then I scroll down till disclaimer text
    And I verify the disclaimer text