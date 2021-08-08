Feature: Post Composer - GIF Search

  Background:
    Given I sign in to use the app
    When I tap on the "Post" button
    And the "Find Out Who You Know on B/R" social promo is "shown"
    And the GIF button is displayed
    Then I tap on GIF button

  @applitools
  Scenario: Verify GIF Search View UI
    And the "GIF Search" screen is displayed

  @regression @TEST_BRUTE-312 @need_applitools
  Scenario: Verify GIF Search Functionality
    And I enter a search term with results
    Then the "GIF Search Results" screen is displayed
    And I navigate back to the composer
    Then I tap cancel on post composer entry
    And Dismiss "Discard Post" alert by clicking "YES"
    Then I sign out to clear the device

  @regression @TEST_BRUTE-313
  Scenario: No GIF Matches Search Criteria Functionality
    And I enter a search term with no results
    Then the textview "No GIFs for that search term" is displayed
    And I navigate back to the composer
    Then I tap cancel on post composer entry
    And Dismiss "Discard Post" alert by clicking "YES"
    Then I sign out to clear the device