@applitools
Feature: Fantasy Basketball

  Background:
    Given I decide to pick teams
    And I search for "Fantasy Basketball"
    And I tap on the "done" button
    And I tap on the "done" button
    And I tap on the "my br" icon tab
    Then I tap on "Fantasy Basketball" textview
    And I tap on "Edit" textview

  Scenario: Verify Fantasy Basketball - Positions
    And I tap on "Position" textview
    And the "Basketball Position" screen is displayed
    Then I tap on "Center" textview
    And the "C list" screen is displayed
    And I search for "Alex Len"
    And I tap on the navigate back button
    And I tap on the navigate back button
    And I tap on the navigate back button
    And I tap on "Edit" textview
    Then the textview "Alex Len" is displayed

  Scenario: Verify Fantasy Basketball - Team
    And I tap on "Team" textview
    And the "Basketball Teams List" screen is displayed
    Then I tap on "Boston Celtics" textview
    And the "Boston Celtics players list" screen is displayed
    And I search for "Marcus Smart"
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on the navigate back button
    And I tap on "Edit" textview
    Then the textview "Marcus Smart" is displayed

  Scenario: Verify Fantasy Basketball - Name
    And I search for "LeBron James"
    And I navigate back using device back button
    And I tap on "Edit" textview
    And I tap on "Name" textview
    And the "Basketball Players Names List" screen is displayed
    And I search for "Alec Burks"
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on "Edit" textview
    Then the textview "My Players" is displayed
    Then the textview "Alec Burks" is displayed
    Then the textview "LeBron James" is displayed