Feature: Bet Center - Leaderboard

  @regression @betting @TEST_QA-7608
  Scenario: Verify Leaderboard button on Bet Center is not available if user Not Signed In.
    Given I navigate to the "my br" tab
    And I tap on Perfect Picks icon
    Then the "New or not logged user Bet Center" screen is displayed
    And I scroll to the "NFL" tab in the Bet center
    And I verify the Leaderboards button disabled for "NFL"
    And I scroll to the "NBA" tab in the Bet center
    And I verify the Leaderboards button disabled for "NBA"
    And I scroll to the "MLB" tab in the Bet center
    And I verify the Leaderboards button disabled for "MLB"
    And I scroll to the "NHL" tab in the Bet center
    And I verify the Leaderboards button disabled for "NHL"

  @applitools @applitools_betting @TEST_QA-2249
  Scenario: Verify Leaderboard page UI.
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    And I tap on Perfect Picks icon
    Then I tap on "Perfect Picks" textview
    And I tap on the "Leaderboard" button
    Then the "Leaderboard - Round" screen is displayed
    And I tap on "This Season" textview
    Then the "Leaderboard - Season" screen is displayed
    Then I sign out to clear the device