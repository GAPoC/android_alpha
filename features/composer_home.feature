Feature: Post Composer - Home View

  Background:
    Given I sign in to use the app

  @applitools
  Scenario: Verify Post Composer - Signed In UI
    And the home feed screen is displayed
    Then I sign out to clear the device

  @need_s8
  Scenario: Verify Posting From Home Feed Functionality
    When I tap on the "Post" button
    Then the "Composer - Entry" screen is displayed
    Then I enter "text" post
    And I tap on "Post" textview
    Then I sign out to clear the device

  @regression
  Scenario: Enter more than 120 Characters in Post Home Feed Functionality
    When I tap on the "Post" button
    And I enter a post with "121" characters
    Then the post button is "disabled" from the post composer
    And the textview "-1" is displayed
    Then I tap cancel on post composer entry
    And Dismiss "Discard Post" alert by clicking "YES"
    Then I sign out to clear the device