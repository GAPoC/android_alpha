@fixme_ANDROID-2641
Feature: User Profile - Username

  Scenario: Verify UI of Follower - User Profile Username
    Given I sign in to use the app
    And I tap on the "search" icon from toolbar menu
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    Then I use the menu to search for "Game of Zones"
    Then I tap on the "comment" icon from the article
    Then the "username" user profile is shown
    Then I sign out to clear the device