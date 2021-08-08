@applitools 
Feature: NFL NEWS league

@TEST_QA-5509
Scenario: Verify NFL Standing - league stream
   Given I navigate to the "my br" tab
   When I add a 'NFL News' to my teams
   And I tap on "NFL" textview
   Then the "NFL News-News" screen is displayed
   When I tap on "Standings" textview
   Then the "NFL News-Standing" screen is displayed
   When I tap on "DIVISION" textview
   Then the "NFL News-Division" screen is displayed
   When I tap on "CONFERENCE" textview
   Then the "NFL News-Conference" screen is displayed
