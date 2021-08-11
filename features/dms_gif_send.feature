@regression @BTEAM-1189 @garegre
Feature: Direct Message - Send GIF

  Background:
    Given I sign in to use the app
    And I tap on the "home" icon tab
    And I tap on the "dm inbox" icon from toolbar menu
    And I tap on the new chat button
    And the "Search For Friends" screen is displayed
    And I search for my friend "ianburn4"
    And I tap on "Ian Rosenfield" textview
    And I tap on "Next" textview

  Scenario: DM - Verify Sending a GIF in a DM
    When I tap on DM GIF button
    And I tap on a GIF image
    Then I verify that a GIF is sent
    And I tap on the navigate back button
    And I tap on the navigate back button
    And I tap on the navigate back button
    And I sign out to clear the device