@regression
Feature:Fantasy News Stream

  Background:
    Given I decide to pick teams
    And I search for "Fantasy Basketball"
    And I tap on the "done" button
    And I tap on the "done" button
    And I tap on the "my br" icon tab
    And the "Join The Team" social promo is "shown"

  Scenario: Verify Fantasy Basketball stream features - My NBA Players
    Then I tap on "Fantasy Basketball" textview
    And I tap on "Edit" textview
    And I tap on "Name" textview
    And I tap on "Alec Burks" textview
    And I navigate back using device back button
    And I navigate back using device back button
    And I tap on the article from "tweet" stream
    Then the article is shown from "Fantasy Basketball" stream
    And I navigate back using device back button
    And I navigate back using device back button
    Then I am redirected to the "my br" screen
    Then I scroll down "1" time
    And I tap on "My NBA Players" textview
    And I tap on "Edit" textview
    And I tap on "My Players" textview
    Then the textview "Alec Burks" is displayed

  Scenario: Verify Fantasy Basketball stream features - Articles
    Then I tap on "Fantasy Basketball" textview
    And I tap on the article from "Fantasy Basketball" stream
    Then the article is shown from "Fantasy Basketball" stream

  Scenario: Verify Fantasy Basketball - Search
    Then I tap on "Fantasy Basketball" textview
    Then I tap on "Edit" textview
    And I tap on "Name" textview
    And I search a name "d.j"
    Then the textview "D.J. Augustin" is displayed
    Then the textview "D.J. Wilson" is displayed
    And I search a name "dj"
    Then the textview "D.J. Augustin" is displayed
    Then the textview "D.J. Wilson" is displayed