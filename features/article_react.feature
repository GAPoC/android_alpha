@fixme @experiment
Feature: Article - Reaction

  Background:
    Given I sign in to use the app

  Scenario: Verifying article reactions UI
    When I tap on the "home" icon tab
    And I tap on the "search" icon from toolbar menu
    And the "Find Out Who You Know on B/R" social promo is "shown"
    Then I use the menu to search for "Game of Zones"
    Then I "react" with a fire
    Then the reaction count is updated
    Then the "Show Us Your Game Face" social promo is "shown"
    When I tap on the reaction count
    And Dismiss "Help your friends find you" alert by clicking "NO THANKS"
    And the "Reaction Lists" screen is displayed
    And I navigate back using device back button
    And I navigate back using device back button
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    Then I sign out to clear the device