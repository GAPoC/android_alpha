@ready_for_regression
Feature: Community Sort

  Scenario: Verify Changing Community Sorting
    Given I navigate to the "my br" tab
    When I tap on "Dodgeball" from my teams
    And I tap on Community textview
    Then the textview "NEWEST" is displayed
    And I sort to the "Top 🔥" posts via sort "label"
    Then the textview "TOP 🔥" is displayed