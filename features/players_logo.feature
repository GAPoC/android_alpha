@applitools
Feature: Verify Players logo

  Scenario: Verify players logo on the stream
    Given I navigate to the "home" tab
    When I tap on the "search" icon from toolbar menu
    And I use the menu to search for "Dennis Santana"
    Then I am redirected to the "Dennis Santana" screen