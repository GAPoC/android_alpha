Feature: Articles - Twitter Stream

  Background:
    Given I navigate to the "home" tab
    When I tap on the "search" icon from toolbar menu
    And I use the menu to search for "Eastbay"

  @regression
  Scenario: Tapping on Twitter Avatar
    When I tap on the twitter "avatar" option
    Then I am redirected to the twitter web view

  @regression
  Scenario: Tapping on the View on Twitter link
    When I tap on the twitter "View on Twitter" option
    Then I am redirected to the twitter web view

  @todo
  Scenario: Tapping on the Twitter Image