@applitools
Feature: Choose Your Teams - More Interests

  Scenario: Verify Choose Teams - More Interests UI
    Given I decide to pick teams
    Then I scroll to "More Interests"
    And I tap on the "More Interests" team option
    Then the "Choose Teams - More Interests" screen is displayed