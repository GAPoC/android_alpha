@applitools
Feature: Standings from Scores - Soccer Tab UI

  Background:
    Given I navigate to the "scores" tab

  @TEST_QA-5501
  Scenario: Verify Soccer Standings - Soccer Tab UI
    When I tap on the "Soccer" scores tab picker
    And I tap on the previous game date
    Then I tap on Standings link