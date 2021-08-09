Feature: Articles - Un-Saved and Saved Stories

  Background:
    Given I navigate to the "home" tab

  @applitools
  Scenario: Verify No Saved Stories UI
    When I tap on the "my br" icon tab
    Then I tap on the "Saved For Later" team option
    Then the "No Stories Saved" screen is displayed

@QA-4848
  Scenario: Verify Saved For Later stories
    When I tap on the "search" icon from toolbar menu
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    And I use the menu to search for "Los Angeles Lakers"
    When I tap on "Los Angeles Lakers" textview
    And I scroll to "Say something…"
    Then I decide to save an article for later
    When I tap on the "my br" icon tab
    Then I tap on the "Saved For Later" team option
    Then the "My Saved Stories" screen is displayed