@applitools @applitools_betting @garegapp @garegreapp
Feature: Bet card - Today's picks - Multiple leagues - BB and Tennis

  Background:
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    Then I tap on Perfect Picks icon

  @TEST_QA-3421
  Scenario: Verify Bet card functionality - NBA
    Then I scroll to the "NBA" tab in the Bet center
    And I complete NEW bet pack for multi league - "NBA"
    Then I sign out to clear the device

  @TEST_QA-7766
  Scenario: Verify Bet card functionality - Pregame
    Then I scroll to the "Pregame" tab in the Bet center
    And I complete NEW bet pack for multi league - "Pregame"
    Then I sign out to clear the device

  @TEST_QA-7767
  Scenario: Verify Bet card functionality - Tennis
    Then I scroll to the "Tennis" tab in the Bet center
    And I complete NEW bet pack for multi league - "Tennis"
    Then I sign out to clear the device