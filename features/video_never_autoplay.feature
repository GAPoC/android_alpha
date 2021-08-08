@regression
Feature: Video - Never Autoplay

  Scenario: Verify Video - Never AutoPlay Functionality
    Given I navigate to the "home" tab
    And I tap on the "settings" icon from toolbar menu
    And I tap on the video autoplay setting
    And I choose "never" only from video autoplay settings
    Then the textview "Never Autoplay Videos" is displayed
    And I tap on the navigate back button
    And I tap on the "my br" icon tab
    And I tap on "Dodgeball" from my teams
    Then I verify that Video Play button displayed