@applitools
Feature: Home Tab

  Background:
    Given I navigate to the "home" tab

  Scenario: Verify Home Tab UI
    When I tap on the "home" icon tab
    Then the home feed screen is displayed