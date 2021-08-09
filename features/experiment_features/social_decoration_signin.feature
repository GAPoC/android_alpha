@readyforregression @reayforapplitools
Feature: Social Decorations sign in

  Background:
    Given I decide to sign in with "email"

  Scenario: Verify if no entries in the Social context list UI
    And I provide a "NoFollowers" email
    Then I provide a "NoFollowers" password
    And I tap on the "continue" button
    Then I tap on the "done" button
    Then I tap on the "done" button
    And the "Home screen - no Social Context entries" screen is displayed
    Then I sign out to clear the device

  Scenario: Verify that Social Context Labels with single users UI
    And I provide a "OneFollower" email
    Then I provide a "OneFollower" password
    And I tap on the "continue" button
    Then I tap on the "done" button
    Then I tap on the "done" button
    And the "Home screen - single Social Context entries" screen is displayed
    Then I sign out to clear the device

  Scenario: Verify Social context label functionality
    Then I provide a "MultipleFollowers" email
    And I provide a "MultipleFollowers" password
    Then I tap on the "continue" button
    Then I tap on the "done" button
    Then I tap on the "done" button
    Then I tap on the "username" link from the context label
    And the "Profile" screen is displayed
    Then I tap on the navigate back button
    And the "home" screen is displayed
    And I tap on the "X other" link from the context label
    Then the "Social Context List" screen is displayed
    And I tap on username from Context label
    Then the "Profile" screen is displayed
    And I tap on the navigate back button
    Then I tap on the navigate back button
    And the "home" screen is displayed
    Then I sign out to clear the device