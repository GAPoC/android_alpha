@regression
Feature: Pull To Refresh - PTR

  Scenario: Verify home stream PTR
    Given I navigate to the "home" tab
    Then I pull to refresh the stream

  Scenario: Verify fire stream PTR
    Given I navigate to the "fire" tab
    Then I pull to refresh the stream