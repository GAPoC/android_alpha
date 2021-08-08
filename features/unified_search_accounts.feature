@ready_for_flag_103
Feature: Unified Search - Accounts

  Background:
    Given I navigate to the "home" tab

  Scenario: Verify is user able to select Interests Results
    When I tap on the "search" icon from toolbar menu
    And I use the menu to search for "busterposeyfan2"
    And I tap on the "Accounts" button
    And I tap on the "busterposeyfan2" button
    Then the textview "busterposeyfan2" is displayed