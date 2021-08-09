@regression
Feature:Team Stream navigation from gamecast team logo

  Scenario: Navigate to team stream using team logo
    Given I navigate to the "home" tab
    Then  I launch the gamecast track
    Then  I tap on the teamstream
    Then the textview "Boston Celtics" is displayed