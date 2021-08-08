@applitools
Feature: Stream

  Scenario: Live Updates Module
    Given I navigate to the "home" tab
    When I tap on the "search" icon from toolbar menu
    And I use the menu to search for "NASCAR News"
    Then live updates module is shown