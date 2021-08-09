@regression
Feature: Settings - Feedback Button

  Background:
    Given I navigate to the "home" tab
    And I tap on the "settings" icon from toolbar menu

  Scenario: Tap on the Send Feedback Button
    When I tap the Send Feedback button
    Then the "Welcome to Gmail" screen is displayed