@regression @TEST_BRUTE-314
Feature: Post Composer - Preview GIF
  
  Scenario: Verify user can preview GIF Functionality
    Given I sign in to use the app
    When I tap on the "Post" button
    Then the GIF button is displayed
    And I enter "GIF" post
    And GIF is added
    Then I tap on close "GIF"
    And GIF is removed
    Then I tap cancel on post composer entry
    And Dismiss "Discard Post" alert by clicking "YES"
    Then I sign out to clear the device