@regression
Feature: Find Friends - From Reactions

  Background:
    Given I sign in to use the app
    When I tap on the "home" icon tab

  Scenario: Tapping on Find Friends from Reactions List
    And I tap on user reaction counts
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    And Dismiss "Help your friends find you" alert by clicking "NO THANKS"
    When I tap on the Find Friends icon from toolbar menu
    Then I am redirected to the "Find Friends" screen
    And I navigate back using device back button
    And I tap on the "home" icon tab
    Then I sign out to clear the device
