Feature: Alert Cards

  @applitools
  Scenario: Reacting to an Article - Not Signed In UI
    Given I navigate to the "alerts" tab
    And I tap on the "fire" icon from the article
    Then the "See What Your Friends Think" screen is displayed

  @need_s8
  Scenario: Tap Fire - Signed In
    Given I sign in to use the app
    And I tap on the "alerts" icon tab
    And I select the first alert
    And I react to an article with a fire
    Then the reaction count is updated
    And I navigate back using device back button
    Then I sign out to clear the device