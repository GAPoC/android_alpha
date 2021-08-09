@todo
Feature: ATT Pre-install Flow - LP 2

  Background:
    Given the upsell screen is shown

  Scenario: Upsell - Pick your Squads
    When I tap on the "Choose Your Teams Now" upsell button
    Then I am redirected to the "Choose Your Teams Now" screen

  Scenario: Upsell - Get You Updates First
    When I tap on the "Pick Your Teams" upsell button
    Then I am redirected to the "Pick Your Teams" screen

  Scenario: Upsell - Personalize your Feed
    When I tap on the "Customize Your Teams Now" upsell button
    Then I am redirected to the "Customize Your Teams Now" screen