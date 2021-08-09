@regression
Feature: Settings - My Preferences

  Scenario: Verify setting preferences for top news
    Given I navigate to the "home" tab
    When  Top news headlines are displayed
    Then I tap on the "settings" icon from toolbar menu
    Then the textview "Top News + My Teams" is displayed
    And I tap on "Top News + My Teams" textview
    And I tap on "My Teams Only" from checked textview
    And I tap on the navigate back button
    Then I verify that Top news headlines are not displayed