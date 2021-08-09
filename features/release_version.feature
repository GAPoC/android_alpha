@regression
Feature: Print RC Version

  Scenario: Verify and Print the RC version
    Given I navigate to the "home" tab
    When I tap on the "settings" icon from toolbar menu
    And I scroll to "Community Guidelines"
    Then the mobile app version is shown