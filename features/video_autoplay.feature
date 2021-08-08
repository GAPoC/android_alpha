@applitools
Feature: Video in Stream - Autoplay

  Background:
    Given I navigate to the "home" tab
    When I tap on the "search" icon from toolbar menu
    And I use the menu to search for "Gridiron Heights"

  Scenario: Verify video autoplay in stream
    Then the "Video Stream - Autoplay" screen is displayed