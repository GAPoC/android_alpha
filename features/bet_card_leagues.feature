@applitools @applitools_betting
Feature: Bet card - Today's picks - Multiple leagues NFL, MLB, NHL

  Background:
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    Then I tap on Perfect Picks icon

  @TEST_QA-7768
  Scenario: Verify Bet card functionality - NFL
    Then I scroll to the "NFL" tab in the Bet center
    And I complete NEW bet pack for multi league - "NFL"
    Then I sign out to clear the device

  @TEST_QA-7769
  Scenario: Verify Bet card functionality - MLB
    Then I scroll to the "MLB" tab in the Bet center
    And I complete NEW bet pack for multi league - "MLB"
    Then I sign out to clear the device

  @TEST_QA-7770
  Scenario: Verify Bet card functionality - NHL
    Then I scroll to the "NHL" tab in the Bet center
    And I complete NEW bet pack for multi league - "NHL"
    Then I sign out to clear the device