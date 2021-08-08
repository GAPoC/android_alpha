Feature: Stream Carousel

  @regression
  Scenario: Navigate to team carousel from stream carousel
    Given I navigate to the "my br" tab
    When I tap on the "Manage Streams" icon from toolbar menu
    Then I can remove the 'The Climb' from my teams
    Then I can remove the 'Trending' from my teams
    And I tap on the save button
    And I tap on the "home" icon tab
    And I scroll till top headlines
    Then stream carousel is displayed
    And I tap on "Dodgeball" textview
    And I tap on the navigate back button

  @regression
  Scenario: Verify stream carousel UI for Add Teams
    Given I navigate to the "home" tab
    When I scroll to "See All"
    And I scroll down "1" time
    Then I verify the "Add Teams" button on the stream carousel
    And I search for "Detroit Tigers"
    And I tap on the "Done" button
    Then the textview "Tigers" is displayed

  @failing
  Scenario: Verify stream carousel UI for See-All
    Given I sign in to use the app
    When I scroll till stream carousel tool tip in home tab
    Then I verify the "See All" button on the stream carousel