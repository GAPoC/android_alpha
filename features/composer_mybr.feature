Feature: Post Composer - POST Tab

  Background:
    Given I sign in to use the app
    When I tap on the "my br" icon tab

  @applitools
  Scenario: Verify Post Tab - Signed In UI
    And I tap on "POSTS" textview
    And the my br feed screen is displayed
    Then I sign out to clear the device

  @need_s8
  Scenario: Verify Posting From My BR - Post Tab Functionality
    When I tap on the "Post" button
    Then the "Composer - Entry" screen is displayed
    Then I enter "text" post
    When I tap on "Post" textview
    Then I sign out to clear the device

  @regression
  Scenario: Enter more than 120 Characters in Post Activity Tab Functionality
    And I tap on "POSTS" textview
    Then I tap on the "Post" button
    And I enter a post with "121" characters
    Then the post button is "disabled" from the post composer
    And the textview "-1" is displayed
    Then I tap cancel on post composer entry
    And Dismiss "Discard Post" alert by clicking "YES"
    Then I sign out to clear the device