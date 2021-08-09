@applitools
Feature: NHL NEWS league

   @TEST_QA-1923
   Scenario: Verify NHL Standing - NHL News
   Given I navigate to the "my br" tab
   When I add a 'NHL News' to my teams
   Then I tap on "NHL" textview
   Then I tap on "Standings" textview
   And the "NHL News-Standing" screen is displayed
   #FIXME
   #Temproraly removed due to Covid division schedule
   #Then I tap on "DIVISION" textview
   #And the "NHL News-Division" screen is displayed
   #Then I tap on "WILD CARD" textview
   #And the "NHL News-WildCard" screen is displayed
   #Then I tap on "CONFERENCE" textview
   #And the "NHL News-Conference" screen is displayed