@applitools
Feature: Fantasy Basketball - My Players

  Scenario: Verify Fantasy Basketball - add players
    Given I decide to pick teams
    And I search for "Fantasy Basketball"
    And I hide the keyboard
    And I tap on the "done" button
    And I tap on the "done" button
    And I tap on the "my br" icon tab
    Then I tap on "Fantasy Basketball" textview
    And I tap on "Edit" textview
    Then the textview "My Players" is not displayed
    And the "Add Players - No My Players" screen is displayed
    Then I tap on "Name" textview
    And I search for "Amir Coffey"
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on "Edit" textview
    And I tap on "My Players" textview
    Then the textview "Amir Coffey" is displayed

  Scenario: Verify Fantasy Basketball - remove players
    Given I decide to pick teams
    And I search for "Fantasy Basketball"
    And I hide the keyboard
    And I tap on the "done" button
    And I tap on the "done" button
    And I tap on the "my br" icon tab
    Then I tap on "Fantasy Basketball" textview
    And I tap on "Edit" textview
    Then I tap on "Team" textview
    And I search for "Anthony Davis"
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on "Edit" textview
    And I tap on "My Players" textview
    Then the textview "Anthony Davis" is displayed
    And I tap on "Anthony Davis" textview
    Then the textview "Anthony Davis" is displayed
    And I navigate back using device back button
    And I tap on "Edit" textview
    Then the textview "Anthony Davis" is not displayed