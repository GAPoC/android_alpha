@applitools
Feature:Fantasy Football

  Scenario: Verify Fantasy Football - Positions
    Given I decide to pick teams
    And I search for "Fantasy Football News"
    And I tap on the "done" button
    And I tap on the "done" button
    And I tap on the "my br" icon tab
    Then I tap on "Fantasy Football" textview
    And I tap on "Edit" textview
    And I tap on "Position" textview
    And the "Football Position" screen is displayed
    Then I tap on "Running Back" textview
    And the "RB list" screen is displayed
    And I tap on the navigate back button
    Then I tap on "Wide Receiver" textview
    And the "WR list" screen is displayed
    And I navigate back using device back button
    Then I tap on "Tight End" textview
    And the "TE list" screen is displayed
    And I tap on the navigate back button
    Then I tap on "Kicker" textview
    And the "K list" screen is displayed
    And I tap on the navigate back button
    Then I tap on "Defense/Special Teams" textview
    And the "D/ST list" screen is displayed
    And I tap on the navigate back button
    Then I tap on "Quarterback" textview
    And the "QB list" screen is displayed
    And I tap on "Aaron Rodgers" textview
    And I navigate back using device back button
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on "Edit" textview
    Then the textview "Aaron Rodgers" is displayed

  Scenario: Verify Fantasy Football - Team
    Given I decide to pick teams
    And I search for "Fantasy Football News"
    And I tap on the "done" button
    And I tap on the "done" button
    And I tap on the "my br" icon tab
    Then I tap on "Fantasy Football" textview
    And I tap on "Edit" textview
    And I tap on "Team" textview
    And the "Football Teams List" screen is displayed
    Then I tap on "Dallas Cowboys" textview
    And the "Dallas Cowboys players list" screen is displayed
    And I tap on "Aaron Parker" textview
    And I navigate back using device back button
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on "Edit" textview
    And I tap on "Team" textview
    And I search for "Nick Bosa"
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on "Edit" textview
    Then the textview "Aaron Parker" is displayed
    Then the textview "Nick Bosa" is displayed

  Scenario: Verify Fantasy Football - Name
    Given I decide to pick teams
    And I search for "Fantasy Football News"
    And I tap on the "done" button
    And I tap on the "done" button
    And I tap on the "my br" icon tab
    Then I tap on "Fantasy Football" textview
    And I tap on "Edit" textview
    And I tap on "Name" textview
    And the "Football Players Names List" screen is displayed
    Then I tap on "A.J. Brown" textview
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on "Edit" textview
    Then the textview "A.J. Brown" is displayed