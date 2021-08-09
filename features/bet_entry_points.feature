@regression @betting
Feature: Bet card - Entry points

  Background:
    Given I sign in to use the app

  @TEST_QA-3561
  Scenario: Verify Stream Bet entry point
    When I tap on the "search" icon from toolbar menu
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    And I use the menu to search for "Sports Betting"
    And I verify the Perfect Pick entry point on team stream
    And I tap on the navigate back button
    Then I sign out to clear the device

  @TEST_QA-5771
  Scenario: Verify Stream Carousel Bet entry point
    And I scroll till stream carousel
    Then I verify that Perfect Picks card present in the Stream carousel
    And I tap on "Perfect Picks" textview
    Then I verify that Perfect Picks screen is the current screen
    Then I sign out to clear the device