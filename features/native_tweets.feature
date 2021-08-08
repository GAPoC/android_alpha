@fixme-QA5524
Feature: Native Tweets

  Background:
    Given I sign in to use the app
    When I tap on the "search" icon from toolbar menu
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    And I use the menu to search for "Underwater Basket Weaving"
    Then the "Find Out Who You Know on B/R" social promo is "shown"
    Then I am redirected to the "Underwater Basket Weaving" screen

  Scenario: View Twitter Post - Commentary
    When I scroll to a Twitter Post "with a Title"
    Then the "Twitter post with Title" screen is displayed

  Scenario: View Twitter Post - No Commentary
    When I scroll to a Twitter Post "without a Title"
    Then the "Twitter post without Title" screen is displayed

  Scenario: View Twitter Picture
    When I scroll to a Twitter Post "with a Picture"
    Then the "Twitter post with a Picture" screen is displayed

  Scenario: View Twitter Video
    When I scroll to a Twitter Post "with a Video"
    Then the "Twitter post with a Video" screen is displayed
