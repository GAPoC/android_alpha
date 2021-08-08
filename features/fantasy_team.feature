@regression
Feature: My Fantasy Team

  Scenario: Verify Fantasy Team functionality
    Given I decide to pick teams
    When I search for "Fantasy Football News"
    And I tap on the "done" button
    And I tap on the "done" button
    And I tap on the "my br" icon tab
    And I scroll down "1" time
    Then I tap on "My NFL Players" textview
    And I tap on "Name" textview
    Then I search for "Jimmy Garoppolo"
    And I navigate back using device back button
    And I navigate back using device back button
    Then I tap on "My NFL Players" textview
    Then I verify My Fantasy Team stream contains stories,tweets about "Jimmy G"
    And I tap on "Edit" textview
    Then the textview "Jimmy Garoppolo" is displayed