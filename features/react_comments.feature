@FIXME_ANDROID-2641
Feature: Reacting To A Comment

 Background:
  Given I sign in to use the app

  Scenario: Verifying comment reactions in conversation feed
    When I tap on the "home" icon tab
    Then I tap on comment button on the top news
    Then I hide the keyboard
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    When I tap on the "comment" icon from the article
    And I react on a comment fire
    Then the "Top News-react to conversation" screen is displayed
    Then I unreact on a comment fire
    Then I tap on the navigate back button
    Then I sign out to clear the device