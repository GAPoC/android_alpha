@regression @BTEAM-1152
Feature: Direct Message - Share Content by DM

  Scenario: Verify Sending Content by DM Functionality
    Given I sign in to use the app
    And I tap on the "fire" icon tab
    When I tap on the share DM button
    And I search for my friend "ianburn4"
    And I tap on "ianburn4" textview
    And I tap on the "Send" button
    Then I sign out to clear the device