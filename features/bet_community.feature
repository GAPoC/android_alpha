Feature: Bet Center - Community selection

  Background:
    Given I navigate to the "my br" tab

  @TEST_QA-3455 @applitools @applitools_betting
  Scenario: Verify the community selection - no suggested teams
    Then I tap on Perfect Picks icon
    Then I complete the community selection with "no" suggested teams

  @TEST_QA-3466 @FIXME_QA-1112
  Scenario: Verify the community selection - two suggested teams
    And I add a 'Los Angeles Lakers' to my teams
    And I add a 'Los Angeles Clippers' to my teams
    And I add a 'San Francisco 49ers' to my teams
    And I add a 'Seattle Seahawks' to my teams
    And I add a 'San Jose Sharks' to my teams
    And I add a 'New York Rangers' to my teams
    And I tap on Perfect Picks icon
    Then I complete the community selection with "two" suggested teams

  @TEST_QA-3481 @applitools @applitools_betting
  Scenario: Verify the community selection - no complete - exit
    And I tap on Perfect Picks icon
    Then I proceed to the pack but not complete it