@regression
Feature: Find Friends - Followers Flow

  Background:
    Given I sign in to use the app
    When I tap on the "my br" icon tab

  Scenario: Tapping on Find Friends from Followers List
    And I tap on the "Edit Profile" button
    And I tap on the "Followers" profile option
    Then I am redirected to the "Find Friends" screen
    When I navigate back using device back button
    When I navigate back using device back button
    When I navigate back using device back button
    Then I am redirected to the "my br" screen
