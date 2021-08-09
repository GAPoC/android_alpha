@applitools
Feature: Community Stream

  Scenario: Verify Dodgeball Community Stream UI
    Given I navigate to the "my br" tab
    When I tap on "Dodgeball" from my teams
    And I tap on Community textview
    Then the "Community Stream" screen is displayed
