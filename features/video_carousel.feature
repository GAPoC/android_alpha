@failing @need_applitools
Feature: Video Carousel

  Scenario: Verify Video Carousel UI
    Given I navigate to the "home" tab
    When I tap on the "search" icon from toolbar menu
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    And I use the menu to search for "Underwater Basket Weaving"
    Then I scroll to related videos
    Then the textview "Do Not delete the related video" is displayed
    And the textview article comment button is displayed
    And the textview "Fire" is displayed
    And I tap on See All Videos textview
    Then the "Related Video View" screen is displayed