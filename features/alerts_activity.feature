@applitools @break_feature_file
Feature: Alerts - Activity Tab

  Scenario: Verify Activity Feed - User Signed In UI
    Given I sign in to use the app
    When I tap on the "alerts" icon tab
    And I tap on "activity" textview
    Then the "Activity Feed - User Signed In" screen is displayed
    Then I sign out to clear the device

  Scenario: Verify Empty Activity Feed - User Not Signed In UI
    Given I navigate to the "alerts" tab
    When I tap on "activity" textview
    Then the "Activity Feed - User Is Not Signed" screen is displayed

  Scenario: Verify Empty Activity Feed - User Is Signed In
    Given I sign in to use the app
    When I tap on the "alerts" icon tab
    And I tap on "activity" textview
    Then the "Empty Activity Feed - User Signed In" screen is displayed
    Then I sign out to clear the device