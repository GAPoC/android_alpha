Feature:  Betting Link - College BB(drop down)

  Background:
    Given I navigate to the "scores" tab
    When I tap on the "College BB" scores tab picker

  @no_games
  Scenario: Verify College BB Betting Link is displayed for Inprogress games
    Then I verify betting link is displayed
    Then I scroll down till disclaimer text
    Then the "disclaimer text" screen is displayed

  @applitools
  Scenario: Verify College BB Betting Link is displayed for Completed games
    And I tap on the previous game date
    Then I verify betting link is displayed
    And I tap on betting link
    Then I navigate back using device back button
    Then I scroll down till disclaimer text
    Then the "disclaimer text" screen is displayed

  @no_games
  Scenario: Verify College BB Betting Link is displayed for upcoming games
    And I tap on the future game date
    And I tap on betting link
    Then I navigate back using device back button
    Then I scroll down till disclaimer text
    Then the "disclaimer text" screen is displayed