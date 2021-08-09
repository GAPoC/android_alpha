@applitools
Feature: Standings from Scores - College BB

  Background:
    Given I navigate to the "scores" tab

  @TEST_QA-5502
  Scenario: Verify College BB Standings - College BB Tab UI
    When I tap on the "College BB" scores tab picker
    And I tap on the previous game date
    Then I tap on "Standings" textview
    Then the "College BB - Standing" screen is displayed