Feature: Bet Center - Results

  @regression @betting @TEST_QA-7830
  Scenario: Verify Past Results button on Bet Center is not available if user Not Signed In.
    Given I navigate to the "my br" tab
    And I tap on Perfect Picks icon
    And I scroll down "2" time
    Then the No Past Result button is displayed

  @applitools @applitools_betting @TEST_QA-3402
  Scenario: Verify Past Result page UI.
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    Then I tap on Perfect Picks icon
    And I tap on the "Leaderboard" button
    Then I tap on "RESULTS" textview
    And the "Results - The Round" screen is displayed
    And I tap on the "Last Round" button
    And the "Results - Last Round" screen is displayed
    Then I sign out to clear the device

  @applitools @applitools_betting @TEST_QA-3389
  Scenario: Verify Past Results button functionality
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    Then I tap on Perfect Picks icon
    Then I scroll down "1" time
    And I tap on the "Past Results" button
    And the "Results - The Round" screen is displayed
    Then I sign out to clear the device