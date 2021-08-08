@regression
Feature: My Profile

  Background:
    Given I sign in to use the app
    Then I tap on the "my br" icon tab
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    And I tap on the "Edit Profile" button

  Scenario: Update Profile Picture
    When I tap on the "Change Profile Picture" profile option
    And I tap on the "Take new photo" photo option
    And I am able to capture a photo for my profile on android
    Then I navigate back using device back button
    And I tap on the "Change Profile Picture" profile option
    And I tap on the "Select new photo" photo option
    Then I choose a photo for my profile on android
    And I tap on the navigate back button
    Then Dismiss "Your photo has been updated" alert by clicking "OK"
    And I tap on the navigate back button
    Then I sign out to clear the device

  @TEST_BRUTE-315
  Scenario: Share Your Invite Link
    When I tap on the "Share Your Invite Link" profile option
    Then the "Share Invite" screen is displayed
    And I navigate back using device back button
    And I navigate back using device back button
    Then I sign out to clear the device