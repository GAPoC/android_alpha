@applitools
Feature: Find Friends - Tabs

  Background:
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    And I tap on the Find Friends icon from toolbar menu

  Scenario: Verify Find Friends tabs UI
    And the find friends "CONTACTS" tab is shown
    Then I tap on "FACEBOOK" textview
    And the find friends "FACEBOOK" tab is shown