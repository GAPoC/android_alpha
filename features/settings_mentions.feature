@regression
Feature: Settings - Mentions

  Background:
    Given I navigate to the "home" tab
    And I tap on the "settings" icon from toolbar menu

  Scenario: User @mention Preference Toggle
    And I tap on "Notification Details" textview
    And I scroll to "Mentions"
    Then the setting should be set to "All Mentions"
    When I tap on "All Mentions" textview
    And I tap on "Who I Follow" from checked textview
    Then the setting should be set to "Who I Follow"
    When I tap on "Who I Follow" textview
    And I tap on "None" from checked textview
    Then the setting should be set to "None"