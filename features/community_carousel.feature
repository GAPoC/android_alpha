@applitools
Feature: Community Carousel

  Scenario: Verify Community Carousel UI
    Given I navigate to the "my br" tab
    When I tap on the "search" icon from toolbar menu
    And I use the menu to search for "Los Angeles Lakers"
    And I tap on "Los Angeles Lakers" textview
    And I scroll till "Recent Posts in Community" text in the Stream
    Then the "Community Carousel" screen is displayed