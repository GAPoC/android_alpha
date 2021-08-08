@regression
Feature: Unified Search - Interests

  Scenario: Verify is user able to select Interests Results
    Given I navigate to the "home" tab
    When I tap on the "search" icon from toolbar menu
    And I enter a search term into unified search "The Climb"
    And I tap on "Interests" textview
    And I tap on "The Climb" textview
    Then the textview "The Climb" is displayed