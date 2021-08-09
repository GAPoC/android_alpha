@applitools @applitools_betting
Feature: Bet card - Today's picks - WF, Golf, Horses

  Background:
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    Then I tap on Perfect Picks icon

  @TEST_QA-8061
  Scenario: Verify Bet card functionality - WF
    Then I scroll to the "WF" tab in the Bet center
    And I complete NEW bet pack for multi league - "WF"
    Then I sign out to clear the device

  @TEST_QA-8065
  Scenario: Verify Bet card functionality - Golf
    Then I scroll to the "Golf" tab in the Bet center
    And I complete NEW bet pack for multi league - "Golf"
    Then I sign out to clear the device

  @TEST_QA-8066
  Scenario: Verify Bet card functionality - Horses
    Then I scroll to the "Horses" tab in the Bet center
    And I complete NEW bet pack for multi league - "Horses"
    Then I sign out to clear the device