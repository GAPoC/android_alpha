@applitools @applitools_betting
Feature: Bet card - Today's picks - Gaming

  @TEST_QA-8624
  Scenario: Verify Bet card functionality - Gaming
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    Then I tap on Perfect Picks icon
    Then I scroll to the "Gaming" tab in the Bet center
    And I complete NEW bet pack for multi league - "Gaming"
    Then I sign out to clear the device
