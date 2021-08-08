Feature: Aggregate Streams - NBA
  Background:
    Given I navigate to the "my br" tab
    When I tap on the add button from my teams
    And I enter "NBA Players" list

  @applitools @garegapp
  Scenario: NBA Players List UI
    Then the "Add NLB Players List" screen is displayed
    When I tap on "Position" textview
    Then the "NBA Position List" screen is displayed
    But I navigate back using device back button
    Then I tap on "Team" textview
    Then the "NBA Team List" screen is displayed
    But I navigate back using device back button
    Then I tap on "Name" textview
    Then the "NBA Player Name List" screen is displayed

  @applitools
  Scenario: Verify Aggregate Streams - NBA Header Streams UI
    And I tap on "Name" textview
    Then I search for "Anthony Davis"
    And I navigate back using device back button
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on the "Done" button
    Then I scroll down "1" time
    And I tap on "My NBA Players" from my teams
    Then the "My NBA Players Stream" screen is displayed

  @regression @smoke6 @smoke7
  Scenario: Adding and Removing an NBA Player
    And I tap on "Name" textview
    And I search for "Anthony Davis"
    And I navigate back using device back button
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on the "Done" button
    When I tap on the add button from my teams
    And I enter "NBA Players" list
    When I remove "Anthony Davis" from My Players
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on the "Done" button
    Then the "My NBA Players" I removed is not displayed in my teams
    Then the "Sign In Screen" screen is displayed