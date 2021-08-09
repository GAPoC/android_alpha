@applitools
Feature: Standings from Scores - NFL tab UI

  Background:
    Given I navigate to the "scores" tab

  @TEST_QA-5623
  Scenario: Verify NFL Standings - NFL tab UI
    When I tap on the "NFL" scores tab picker
    And I tap on the previous game date
    Then I tap on "Standings" textview
    Then the "NFL - Division Standing" screen is displayed
    Then I tap on "Conference" textview
    Then the "NFL - Conference Standing" screen is displayed