@ready_for_applitools
Feature: CCPA - US Locale

  Scenario: Verify US Locale - CCPA UI
    Given the "CCPA - Welcome" screen is displayed
    When I decide to pick teams
    And I search for "Golden State Warriors"
    And I tap on the "done" button
    And I tap on the "maybe later" button
    Then I tap on the "settings" icon from toolbar menu
    And I scroll to "Do Not Sell My Personal Information "
    Then the button "Do Not Sell My Personal Information" is displayed