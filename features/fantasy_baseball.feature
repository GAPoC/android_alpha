@applitools
Feature: Fantasy Baseball

  Background:
    Given I decide to pick teams
    And I search for "Fantasy Baseball"
    And I tap on the "done" button
    And I tap on the "done" button
    And I tap on the "my br" icon tab
    Then I tap on "Fantasy Baseball" textview
    And I tap on "Edit" textview

  Scenario: Verify Fantasy Baseball - Positions
    And I tap on "Position" textview
    And the "Baseball Position" screen is displayed
    Then I tap on "Catcher" textview
    And the "Baseball C list" screen is displayed
    And I search for "Austin Allen"
    And I tap on the navigate back button
    And I tap on the navigate back button
    And I tap on the navigate back button
    And I tap on "Edit" textview
    Then the textview "Austin Allen" is displayed

  Scenario: Verify Fantasy Baseball - Team
    And I tap on "Team" textview
    And the "Baseball Teams List" screen is displayed
    Then I tap on "Boston Red Sox" textview
    And the "Boston Red Sox players list" screen is displayed
    And I search for "Bryan Mata"
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on the navigate back button
    And I tap on "Edit" textview
    Then the textview "Bryan Mata" is displayed

  Scenario: Verify Fantasy Baseball - Name
    And I search for "Bradley Zimmer"
    And I navigate back using device back button
    And I tap on "Edit" textview
    And I tap on "Name" textview
    And the "Baseball Players Names List" screen is displayed
    And I search for "Cody Reed"
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on "Edit" textview
    Then the textview "Cody Reed" is displayed
    Then the textview "Bradley Zimmer" is displayed