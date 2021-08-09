@applitools
Feature: Standings from Scores - College FB

  Background:
    Given I navigate to the "scores" tab

  Scenario: Verify Standings from College FB tab - UI
    When I tap on the "College FB" scores tab picker
    And I tap on the previous game date
    Then I tap on "Standings" textview
    Then the "College FB - Standing" screen is displayed