@au_regression
Feature: AU Locale

  Scenario: Verify AU Locale Add Teams Functionality
    Given I navigate to the "my br" tab
    When I tap on the add button from my teams
    Then I search for "Sports Betting"
    And I tap on the "done" button
    Then the 'Sports Betting' I added is displayed in my teams