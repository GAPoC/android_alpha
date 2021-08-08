Feature: Aggregate Streams - MLB

  Background:
    Given I navigate to the "my br" tab
    When I tap on the add button from my teams
    And I enter "MLB Players" list

  @applitools
  Scenario: MLB Players List UI
    Then the "Add MLB Players List" screen is displayed
    When I tap on "Position" textview
    Then the "MLB Position List" screen is displayed
    But I navigate back using device back button
    Then I tap on "Team" textview
    Then the "MLB Team List" screen is displayed
    But I navigate back using device back button
    Then I tap on "Name" textview
    Then the "MLB Name List" screen is displayed

  @applitools
  Scenario: Verify Aggregate Streams - MLB Header Streams UI
    And I tap on "Name" textview
    Then I search for "Alec Mills"
    And I tap on the navigate back button
    And I tap on the navigate back button
    And I tap on the navigate back button
    And I tap on the "Done" button
    Then I scroll down "1" time
    And I tap on "My MLB Players" from my teams
    Then the "My MLB Players Stream" screen is displayed

  @regression @smoke6 @smoke7 @gareg
  Scenario: Adding and Removing an MLB Player
    And I tap on "Name" textview
    And I search for "Alec Mills"
    And I tap on the navigate back button
    And I tap on the navigate back button
    And I tap on the navigate back button
    And I tap on the "Done" button
    When I tap on the add button from my teams
    And I enter "MLB Players" list
    When I remove "Alec Mills" from My Players
    And I tap on the navigate back button
    And I tap on the navigate back button
    And I tap on the "Done" button
    Then the "My MLB Players" I removed is not displayed in my teams