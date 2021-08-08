@FIXME_ANDROID-2655
Feature: Reacting To A Standalone Track

  Scenario: Verify reactions on standalone tracks
    Given I sign in to use the app
    When I tap on the "home" icon tab
    Then I scroll till top headlines
    And I tap on more headlines in the top headlines
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    And I tap on Fire from the standalone track
    Then the "Top News-react to standalone" screen is displayed