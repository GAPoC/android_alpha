@applitools @applitools_betting
Feature: Bet card - Today's picks - One default league

  Background:
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    Then I tap on Perfect Picks icon

  @TEST_QA-3071
  Scenario: Verify that user can exit from any Bet card by taping the Back button
    And I do not complete NEW bet pack
    Then I sign out to clear the device

  @TEST_QA-3415
  Scenario: Verify Bet card functionality for default league
    And I complete NEW bet pack
    Then I sign out to clear the device