Feature: Aggregate Streams - NFL
  Background:
    Given I navigate to the "my br" tab
    When I tap on the add button from my teams
    And I enter "NFL Players" list

  @applitools
  Scenario: NFL Players List UI
    Then the "Add NFL Players List" screen is displayed
    When I tap on "Position" textview
    Then the "NFL Position List" screen is displayed
    But I navigate back using device back button
    Then I tap on "Team" textview
    Then the "NFL Team List" screen is displayed
    But I navigate back using device back button
    Then I tap on "Name" textview
    Then the "NFL Player Name List" screen is displayed

  @applitools
  Scenario: Verify Aggregate Streams - NFL Header Streams UI
    And I tap on "Name" textview
    Then I search for "Aaron Brewer"
    And I navigate back using device back button
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on the "Done" button
    Then I scroll down "1" time
    And I tap on "My NFL Players" from my teams
    Then the "My NFL Players" screen is displayed

  @regression @smoke6 @smoke7
  Scenario: Adding and Removing an NFL Player
    And I tap on "Name" textview
    And I search for "Aaron Brewer"
    And I navigate back using device back button
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on the "Done" button
    When I tap on the add button from my teams
    And I enter "NFL Players" list
    When I remove "Aaron Brewer" from My Players
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on the "Done" button
    Then the "My Fantasy Team" I removed is not displayed in my teams