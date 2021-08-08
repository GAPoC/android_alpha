@applitools
Feature:Schedules from Gamecast - World Football News

  @TEST_QA-7492
  Scenario: Verify World football team standings and schedule UI
    Given I sign in to use the app
    And I tap on the "my br" icon tab
    And I tap on the "search" icon from toolbar menu
    And I use the menu to search for "World Football News"
    And I tap on "World Football News" textview
    And I tap on the "schedules" stream button
    Then the "schedules" screen is displayed
    Then I tap on the "standings" stream button
    Then the "standings" screen is displayed