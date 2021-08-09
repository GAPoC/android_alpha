@applitools
Feature: Aggregate Streams - Olympics

  Background:
    Given I navigate to the "my br" tab
    When I tap on the add button from my teams
    And I scroll to "Olympics"
    Then I tap on "Olympics" textview

  Scenario: Verify Aggregate Streams - Olympics Header Streams UI
    Then I tap on "Olympic News" textview
    And I navigate back using device back button
    Then I tap on "Done" textview
    And I scroll down "1" time
    And I tap on "Olympics" from my teams
    Then the "Olympic News Stream" screen is displayed

  Scenario: Verifying Winter, Summer, and Olympics News UI
    Then the "Olympics" screen is displayed
    When I tap on "Countries" textview
    Then the "Olympic Countries" screen is displayed
    Then I tap on the navigate back button
    And I tap on "Summer Olympics" textview
    Then the "Summer Olympics" screen is displayed
    When I tap on the navigate back button
    And I tap on "Winter Olympics" textview
    Then the "Winter Olympics" screen is displayed
    When I tap on the navigate back button
    And I tap on "Olympic News" textview
    And I tap on the navigate back button
    And I tap on the "done" button
    Then the textview "Olympics" is displayed