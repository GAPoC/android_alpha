@need_s8
Feature: Post Composer - Post GIF

  Background:
    Given I sign in to use the app
    When I tap on the "Post" button
    And the GIF button is displayed

    Scenario: Verify user can post GIF Functionality
      Then I enter "GIF" post
      And I tap on "Post" textview
      Then I sign out to clear the device

    Scenario: Verify user can post GIF and Text Functionality
      Then I enter "GIF and text" post
      And I tap on "Post" textview
      Then I sign out to clear the device