@QA-2007_needs_username_search
Feature: User Profile

  Background:
    Given I sign in to use the app
    And I tap on the "search" icon from toolbar menu
    Then I use the menu to search for "Game of Zones"

  Scenario: View User Profile
    Then I tap on the "comment" icon from the article
    And I tap on a "user logo" in the reaction list
    Then I am redirected to the users full screen profile