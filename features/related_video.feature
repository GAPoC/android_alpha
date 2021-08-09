@regression
Feature: Related Video

  Scenario: Verify Related Video View UI With Never Auto play settings
    Given I navigate to the "home" tab
    And I tap on the "settings" icon from toolbar menu
    And I tap on the video autoplay setting
    And I choose "never" only from video autoplay settings
    Then the textview "Never Autoplay Videos" is displayed
    And I tap on the navigate back button
    And I tap on the "my br" icon tab
    And I tap on "Dodgeball" from my teams
    And I tap on the "manual" play video
    Then the "Related Video View" screen is displayed

@needs_applitools
  Scenario: Verify Related Video View UI With Auto play settings
    Given I navigate to the "home" tab
    And I tap on the "my br" icon tab
    And I tap on "Dodgeball" from my teams
    And I tap on the "auto" play video
    Then the "Related Video View" screen is displayed