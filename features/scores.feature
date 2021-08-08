Feature: Scores Tab

  Background:
    Given I navigate to the "scores" tab

  @applitools
  Scenario: Verify Scores Tab UI
    Then the "Scores" screen is displayed

  @regression @TEST_QA-7496
  Scenario: Verifying Scores Tabs Functionality
    Then "Top Games" scores are shown if available
    When I tap on the "MLB" scores tab picker
    Then "MLB" scores are shown if available
    When I tap on the "Soccer" scores tab picker
    Then "Soccer" scores are shown if available
    When I tap on the "College FB" scores tab picker
    Then "College FB" scores are shown if available
    And I can switch leagues to "BIG 12"
    Then "College FB" scores are shown if available
    When I tap on the "NBA" scores tab picker
    Then "NBA" scores are shown if available
    When I tap on the "NHL" scores tab picker
    Then "NHL" scores are shown if available
    When I tap on the "NFL" scores tab picker
    Then "NFL" scores are shown if available
    When I tap on the "College BB" scores tab picker
    Then "College BB" scores are shown if available