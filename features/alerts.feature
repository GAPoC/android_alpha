Feature: Alerts Tab

  @applitools
  Scenario: Verify Alerts Tab UI
    Given I navigate to the "alerts" tab
    Then the user is shown that the alert feed is "active"

  @applitools
  Scenario: Verify Empty Alert Feed UI
    Given I navigate to the "my br" tab
    When I tap on the "Manage Streams" icon from toolbar menu
    Then I can remove the 'Trending' from my teams
    Then I can remove the 'Dodgeball' from my teams
    And I tap on the save button
    Then I tap on the "alerts" icon tab
    Then the user is shown that the alert feed is "empty"

  @regression
  Scenario: Verify Viewing an Article
    Given I navigate to the "alerts" tab
    When I tap on the article from "alerts" stream
    Then the article is shown from "alerts" stream