Feature: Commentary Access from Gamecasts - manipulation with comment

  Background:
    Given I sign in to use the app
    And I tap on "Scores" textview
    And I tap on the "NBA" scores tab picker
    Then I tap on the previous game date
    And I view a "completed" gamecast

  @posponed_games
  Scenario: Verify that user can react on comment
    And I tap on Gamecast comments textview
    Then I tap on the fire comment button
    And the "Comment reacted" screen is displayed
    Then I tap on the fire comment button
    And the "Comment un reacted" screen is displayed

  @ready_need_teststream
  Scenario: Verify that user can add a comment
    And I tap on Gamecast comments textview
    Then I tap on Reply to comment textview
    And I add a comment to the "gamecast" comment
    Then the comment is posted to the gamecast

  @posponed_games
  Scenario: Verify that user can open profile by clicking on commenter icon
    And I tap on Gamecast comments textview
    Then I tap on Profile icon for comment
    Then the "User Profile Comments" screen is displayed