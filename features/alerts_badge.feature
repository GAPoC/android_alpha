Feature: Alert Tab - Badge

  Background:
  Given I sign in to use the app

  @regression
  Scenario: Verify Alerts Tab Barge on Alert Icon and Alerts Activity Tab
    Then I verify the Alert Tab Badge functionality

  @applitools
  Scenario: Verify Alerts Tab Barge reset
    Then the "Alerts Tab Badge" screen is displayed
    Then I tap on the "alerts" icon tab
    And the "Find Out Who You Know on B/R" social promo is "shown"
    And the "Alerts Activity Tab Badge" screen is displayed
    And I tap on "ACTIVITY" textview
    And I tap on the "home" icon tab
    Then I verify the Alert Tab Badge reset after alerts view