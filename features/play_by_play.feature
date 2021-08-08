@todo
Feature: Play by Play

  Scenario: MLB Scores Play by Play
    Given I navigate to the "scores" tab
    And I navigate in scores to "MLB" tab
    Then "MLB" scores are shown if available
    When I tap on an "MLB" game in progress
    Then I am shown the "MLB" gamecast
    Then I am shown the PBP module with PBP events

  Scenario: MLB Scores Plays tab
    Given I am in an "MLB" gamecast
    And I tap on the "Plays" tab
    Then I am shown the "Scoring Summary" and "By Quarter" sub tabs

  Scenario: MLB Plays Live Scoring Summary Sub Tab
    Given I am in an "MLB" gamecast
    And I tap on the "Plays" tab
    Then I am shown the Scoring Summary tab
    And I am shown Scoring Summary tab event items

  Scenario: MLB Plays Live By Quarter Sub Tab
    Given I am in an "MLB" Gamecast
    And I tap on the "Plays" tab
    Then I am shown the Scoring Summary tab
    Then I tap the By Quarter tab
    And I am shown By Quarter tab event items

  Scenario: NFL Scores Play by Play
    Given I navigate to the "scores" tab
    And I navigate in scores to "NFL" tab
    Then "NFL" scores are shown if available
    When I tap on an "NFL" game in progress
    Then I am shown the "NFL" gamecast
    Then I am shown the PBP module with PBP events

  Scenario: NFL Scores Plays Tab
    Given I am in an "NFL" gamecast
    And I tap on the "Plays" tab
    Then I am shown the "Scoring Summary" and "By Quarter" sub tabs

  Scenario: NFL Plays Live Scoring Summary Sub Tab
    Given I am in an "NFL" gamecast
    And I tap on the "Plays" tab
    Then I am shown the Scoring Summary tab
    And I am shown Scoring Summary tab event items

  Scenario: NFL Plays By Quarter Sub Tab
    Given I am in an "NFL" gamecast
    And I tap on the "Plays" tab
    Then I am shown the Scoring Summary tab
    Then I tap the By Quarter tab
    And I am shown By Quarter tab event items