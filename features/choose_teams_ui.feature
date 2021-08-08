@applitools
Feature: Choose Your Teams

  Background:
    Given the "Welcome" screen is displayed
    When I decide to pick teams


  Scenario: Verify Choose Your Teams UI
    Then the "Choose Your Teams" screen is displayed