@applitools
Feature: Standings from NBA tab - UI

  Background:
    Given I navigate to the "scores" tab

  @TEST_QA-5499
  Scenario: Verify NBA Standings - NBA tab UI
    When I tap on the "NBA" scores tab picker
    And I tap on the previous game date
    Then I tap on "Standings" textview
    Then the "NBA - Conference Standing" screen is displayed
    Then I tap on "League" textview
    Then the "NBA - League Standing" screen is displayed
    Then I tap on "Tank" textview
    Then the "NBA - Tank Standing" screen is displayed