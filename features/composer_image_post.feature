Feature: Verify user can upload an image

  @need_s8 @TEST_BRUTE-112 @TWB-477
  Scenario: Verify user can upload an image
    Given I sign in to use the app
    When I tap on the "Post" button
    And the media button is displayed
    Then I enter "image" post
    And I tap on "Post" textview
    Then I sign out to clear the device