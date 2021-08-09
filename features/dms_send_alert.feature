@regression
Feature: Direct Message - Send Alert

  Scenario: Sending an Alert
    Given I sign in to use the app
    And I tap on the "alerts" icon tab
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    When I tap on the share DM button
    And I search for my friend "busterposeyfan2"
    And I tap on "Ian Rosenfield" textview
    And I tap on the "Send" button
    Then I sign out to clear the device