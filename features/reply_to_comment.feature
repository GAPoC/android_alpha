@FIXME_ANDROID-2641
Feature: Comment - Reply

  Background:
    Given I sign in to use the app
    When I tap on the "home" icon tab
    And I tap on the "search" icon from toolbar menu
    Then I use the menu to search for "Game of Zones"
    
  Scenario: Replying to Any Comment
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    Then I tap on the "comment" icon from the article
    Then the user is redirected to the comment thread
    And I reply to a comment
    Then the person I'm replying to is appended