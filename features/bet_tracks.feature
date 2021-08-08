Feature: Bet Tracks

  @regression @betting @TEST_QA-8110 @need_applitools
  Scenario: Verify Stream Bet Tracks functionality for the non-legal (CA) state
    Given I navigate to the "my br" tab
    When I tap on "Dodgeball" from my teams
    And I verify the Bet Track "UI" for the nonlegal state

  @applitools @applitools_betting @TEST_QA-8324
  Scenario: Verify Bet Tracks info modal
    Given I navigate to the "my br" tab
    When I tap on "Dodgeball" from my teams
    And I verify the Bet Track info modal

  @regression @betting @TEST_QA-8089
  Scenario: Verify Stream Bet Tracks functionality for the non-legal (CA) state
    Given I navigate to the "my br" tab
    When I tap on "Dodgeball" from my teams
    And I verify the Bet Track "functionality" for the nonlegal state