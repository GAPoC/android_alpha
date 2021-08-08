Feature: Articles - Streams

  Background:
    Given I navigate to the "home" tab
    And I tap on the "search" icon from toolbar menu

@QA-3538
  Scenario: Verify tapping on an article opens the associated stream
    Then I use the menu to search for "Anthony Knockaert"
    And I tap on the article from "articles" stream
    Then the article is shown from "articles" stream

@applitools
  Scenario: Verify tapping on a twitter article opens the associated stream
    Then I use the menu to search for "NASCAR News"
    And I tap on the article from "tweet" stream
    Then the article is shown from "twitter" stream

@applitools
  Scenario: Verify empty stream screen UI
    And I use the menu to search for "Bjorn Sigurdarson"
    Then I am redirected to the "Empty Article Stream" screen