@applitools
Feature: Standings from Scores - NHL tab UI

  Background:
    Given I navigate to the "scores" tab

  @TEST_QA-1924
  Scenario: Verify NHL Standings - Scores NHL tab UI
    When I tap on the "NHL" scores tab picker
    And I tap on the previous game date
    Then I tap on "Standings" textview
    Then the "NHL - Standing - Division" screen is displayed
    #FIXME
    #Temproraly removed due to Covid division schedule
    #And I tap on "WILD CARD" textview
    #Then the "NHL - Standing - WILD CARD" screen is displayed
    #And I tap on "CONFERENCE" textview
    #Then the "NHL - Standing - CONFERENCE" screen is displayed

  Scenario: Verify NHL Standings - Teamstream UI
    When I tap on the "NHL" scores tab picker
    And I tap on the previous game date
    Then I view a "completed" gamecast
    And I tap on the Gamecast Standings button
    Then the "Gamecast NHL - Standing" screen is displayed


