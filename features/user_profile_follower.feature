@applitools
Feature: User Profile - Follower

  Scenario: Verify UI of Follower - User Profile
    Given I sign in to use the app
    Then I tap on the "my br" icon tab
    And I tap on the "Edit Profile" button
    When I tap on the "Followers" profile option
    Then the "follow" user profile is shown