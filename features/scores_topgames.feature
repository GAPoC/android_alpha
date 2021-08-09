Feature: Scores - Top Games

  @TEST_QA-7503 @applitools
  Scenario: Verify Top Games Tab UI
    Given I navigate to the "scores" tab
    Then the "Top Games" scores screen is displayed

  @applitools
  Scenario: Verify Top Games Date Nav Functionality for Yesterday, Today and Tomorrow
    Given I navigate to the "scores" tab
    Then I tap on the previous game date
    And the "Top Games - Yesterday" scores screen is displayed
    Then I tap on "Today" textview
    And I tap on the future game date
    And the "Top Games - Tomorrow" scores screen is displayed

  @ready_for_regression @TEST_QA-4841
  Scenario: Verify Golf Tab UI in Top Games
    Given I navigate to the "my br" tab
    When I add a 'Golf News' to my teams
    And I tap on the "scores" icon tab
    And I verify the PGA tour golf game in top games