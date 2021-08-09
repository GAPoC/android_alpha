@todo @FIXME_ANDROID-2641
Feature: Mentions

  Background:
    Given I sign in to use the app
    When I tap on the "home" icon tab
    And I tap on the "search" icon from toolbar menu
    Then I use the menu to search for "UNINTERRUPTED"

  Scenario: '@' Mention A User
    Then I tap on the "comment" icon from the article
    And I search a user by their "username"
    And I search a user by their "first name"
    And I search a user by their "last name"
    Then I can @ mention a user I am following

  Scenario: Multiple '@' Mentions
    Then I tap on the "comment" icon from the article
    And I @ mention a user "20" times