@FIXME_QA-8558
Feature: Pick Teams - Local Teams

  Background:
    Given I decide to pick teams
    And I tap on the "Show Teams Near Me" button
    And I "allow" the alert permission

  Scenario: Verify local teams are displayed
    Then the local teams are shown to the user

  Scenario: Verify users can choose local teams
    Then the user can choose the local teams