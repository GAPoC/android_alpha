@regression @betting
Feature: Perfect Pick Winner Track

  Background:
    Given I sign in to use the app

  @TEST_QA-6097
  Scenario: Verify Perfect Pick Winner Track functionality - Team Stream
    When I tap on the "search" icon from toolbar menu
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    And I use the menu to search for "Los Angeles Lakers"
    And I verify the Perfect Pick Winner Track on the Stream
    And I tap on "Home" textview
    Then I sign out to clear the device

  @TEST_QA-8067
  Scenario: Verify Perfect Pick Winner Track functionality - Home stream
    And I verify the Perfect Pick Winner Track on the Stream
    Then I sign out to clear the device