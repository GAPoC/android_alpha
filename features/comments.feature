Feature: Comments

  Background:
    Given I sign in to use the app
    When I tap on the "home" icon tab
    And I tap on the "search" icon from toolbar menu
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    Then I use the menu to search for "Game of Zones"
    And the "*New* Video Posts 📽" social promo is "shown"

  @FIXME_ANDROID-2641
  Scenario: Tapping On Comment Icon
    Then I tap on the "comment" icon from the article
    Then the user is redirected to the comment thread
    And I tap on the navigate back button
    And I tap on the navigate back button
    Then I sign out to clear the device

  @not_for_regression
  Scenario: Comment From Comment Thread
    Then I tap on the "comment" icon from the article
    And I add a comment to the "thread" comment
    Then the comment is posted to the thread

  @not_for_regression
  Scenario: Replying To A Comment
    Then I tap on the "comment" icon from the article
    And I reply to a comment
    Then the person I'm replying to is mentioned
    Then my comment reply is posted

  @not_for_regression
  Scenario: Reporting A Comment
    Then I tap on the "comment" icon from the article
    And I report a comment
    Then I am alerted that that comment has been reported

  @regression
  Scenario: Comment Counter
    Then the article is shown the appropriate comment count text

  @not_for_regression
  Scenario: Reply Autofills Multiple Mentions
    Then I tap on the "comment" icon from the article
    And I reply to a comment
    And I reply to a comment with multiple mentions
    Then my comment reply is posted

  @FIXME_ANDROID-2641
  Scenario: Expand the comment input field to account for up to 5 lines
    Then I tap on the "comment" icon from the article
    And I reply to a comment
    When the user provides 5 lines of comments
    Then the input field is scrollable
    And the send button is still shown
    And I tap on the navigate back button
    And I tap on the navigate back button
    Then I sign out to clear the device