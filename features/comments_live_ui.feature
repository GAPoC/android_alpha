@fix_me_QA-8567 @BTEAM-1188
Feature: Comments - Live Comments UI

  Scenario: Verify Live Comment UI
    Given I sign in to use the app
    And I tap on the "home" icon tab
    And I tap on the "search" icon from toolbar menu
    And the "Find Out Who You Know on B/R" social promo is "shown"
    And I use the menu to search for "Game of Zones"
    And I tap on the "comment" icon from the article
    When I sort to the "Live Chat" comments via sort "caret"
    Then the "Live Comments" screen is displayed
    And I tap on the navigate back button
    And I tap on the navigate back button
    And I tap on the navigate back button
    And I sign out to clear the device