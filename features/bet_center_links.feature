@regression @betting @TEST_QA-7267
Feature: Partners Betting Links in the Bet Center

  Scenario: Verify Partners Betting Links functionality
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    Then I tap on Perfect Picks icon
    And I scroll to the "NBA" tab in the Bet center
    Then I verify the betting link & disclaimer part functionality for "NBA" tab
    And I scroll to the "MLB" tab in the Bet center
    Then I verify the betting link & disclaimer part functionality for "MLB" tab
    And I scroll to the "NFL" tab in the Bet center
    Then I verify the betting link & disclaimer part functionality for "NFL" tab
    And I sign out to clear the device