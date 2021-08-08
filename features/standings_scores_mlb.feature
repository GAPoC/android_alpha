@applitools
Feature: Standings from Scores page - MLB

  Background:
    Given I navigate to the "scores" tab

  @TEST_QA-5496
  Scenario: Verify MLB Standings - MLB tab UI
    When I tap on the "MLB" scores tab picker
    And I tap on the previous game date
    Then I tap on "Standings" textview
    Then the "MLB - Division Standing" screen is displayed
    Then I tap on "League" textview
    Then the "MLB - League Standing" screen is displayed