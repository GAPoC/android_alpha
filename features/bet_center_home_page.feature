Feature: Bet Center - Home page

  Background:
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    Then I tap on Perfect Picks icon

  @applitools @applitools_betting @TEST_QA-3411
  Scenario: Verify the Bet Center Home page UI
    Then the "Bet Center Home page" screen is displayed
    Then I sign out to clear the device

  @regression @betting @TEST_QA-3409
  Scenario: Verify Recent Picks functionality - Team sports
    And I scroll to the "NFL" tab in the Bet center
    Then I verify the RECENT part functionality for "NFL" tab
    And I scroll to the "MLB" tab in the Bet center
    Then I verify the RECENT part functionality for "MLB" tab
    And I scroll to the "NBA" tab in the Bet center
    Then I verify the RECENT part functionality for "NBA" tab
    And I scroll to the "NHL" tab in the Bet center
    Then I verify the RECENT part functionality for "NHL" tab
    And I scroll to the "Pregame" tab in the Bet center
    Then I verify the RECENT part functionality for "Pregame" tab
    And I scroll to the "WF" tab in the Bet center
    Then I verify the RECENT part functionality for "WF" tab
    Then I sign out to clear the device

  @regression @betting
  Scenario: Verify Recent Picks functionality - Individual sports
    And I scroll to the "Wrestling" tab in the Bet center
    Then I verify the RECENT part functionality for "Wrestling" tab
    And I scroll to the "MMA" tab in the Bet center
    Then I verify the RECENT part functionality for "MMA" tab
    And I scroll to the "Tennis" tab in the Bet center
    Then I verify the RECENT part functionality for "Tennis" tab
    And I scroll to the "Boxing" tab in the Bet center
    Then I verify the RECENT part functionality for "Boxing" tab