@regression
Feature: Stream Recommendation Carousel

  Background:
    Given I navigate to the "home" tab
    When I scroll to "Invite Friends"

  Scenario: Verify stream recommendation carousel navigation
    Then stream recommendation carousel is displayed
    And I tap on "Sports Business" textview
    Then the "Sports Business" screen is displayed

    @failing
  Scenario: Verify stream recommendation carousel for See-All
    And I swipe to see all recommended teams in the carousel and add teams
    Then the textview "See All" is displayed