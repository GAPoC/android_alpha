@applitools
Feature: Home Tab_Top News Headlines

  Background:
    Given I sign in to use the app

  Scenario: Verify Top News headlines module  UI
    When I tap on the "home" icon tab
    Then I scroll till top headlines
    Then the textview "Fire" is displayed
    Then the textview article comment button is displayed
    Then the textview share DM is displayed
    Then the textview share is displayed
    Then the textview "MORE NEWS" is displayed
    And I scroll to "See All"
    And I tap on "See All" textview
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    Then the "Top News" screen is displayed
    And I tap on the navigate back button