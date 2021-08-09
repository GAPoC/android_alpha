@applitools @applitools_betting
Feature: Bet card - Today's picks - Wrestling leagues - Wrestling, MMA, Boxing

  Background:
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    Then I tap on Perfect Picks icon

  @TEST_QA-7771
  Scenario: Verify Bet card functionality - Wrestling
    Then I scroll to the "Wrestling" tab in the Bet center
    And I complete NEW bet pack for multi league - "Wrestling"
    Then I sign out to clear the device

  @TEST_QA-7772
  Scenario: Verify Bet card functionality - MMA
    Then I scroll to the "MMA" tab in the Bet center
    And I complete NEW bet pack for multi league - "MMA"
    Then I sign out to clear the device

  @TEST_QA-7773
  Scenario: Verify Bet card functionality - Boxing
    Then I scroll to the "Boxing" tab in the Bet center
    And I complete NEW bet pack for multi league - "Boxing"
    Then I sign out to clear the device