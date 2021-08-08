@au_regression
Feature: AU Locale - Socials

  Background:
    Given I accept the GDPR rules by default
    When I navigate to the "my br" tab
    And I add a 'Top News' to my teams
    When I tap on the "alerts" icon tab

  Scenario:Verify Comment button is not displayed
    Then I verify the Comment button is not displayed