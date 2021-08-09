@reayforapplitools
Feature: Social Decorations sign out

  Scenario: Verify if user is not signed in no Social Context UI
    Given I do not sign in to use the app
    Then the "Home screen - no Social Context entries" screen is displayed
