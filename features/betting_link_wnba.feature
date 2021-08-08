Feature:  Betting Link - WNBA((no drop down)

  Background:
    Given I navigate to the "scores" tab
    When I tap on the "WNBA" scores tab picker

  @regression
  Scenario: Verify WNBA Betting Link is displayed for Inprogress games
    Then the "WNBA" scores screen is displayed
    Then I verify betting link is displayed
    Then I scroll down till disclaimer text
    And I verify the disclaimer text

  @regression
  Scenario: Verify WNBA Betting Link is displayed for Completed games
    Then the "WNBA" scores screen is displayed
    And I tap on the previous game date
    Then I verify betting link is displayed
    And I tap on betting link
    Then I navigate back using device back button
    Then I scroll down till disclaimer text
    And I verify the disclaimer text

  @no_game
  Scenario: Verify WNBA Betting Link is displayed for upcoming games
    Then the "WNBA" scores screen is displayed
    And I tap on the future game date
    And I tap on betting link
    Then I navigate back using device back button
    Then I scroll down till disclaimer text
    And I verify the disclaimer text