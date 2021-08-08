@regression
  Feature: Search

  Scenario: Verify if player name is displayed in the searched results
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    And I tap on the "search" icon from toolbar menu
    And I use the menu to search for "A.J. Br"
    Then the textview "A.J. Brown" is displayed
    And I tap on the navigate back button
    Then I am redirected to the "my br" screen