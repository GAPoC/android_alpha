@regression
Feature: Settings - Muted List

  Background:
    Given I sign in to use the app
    When I tap on the "settings" icon from toolbar menu

  Scenario: View Muted List
    And I scroll to "Blocked User List"
    And I tap on "Blocked User List" textview
    Then I am redirected to the "Blocked Users" screen