@FIXME_QA-8697 @BTEAM-1150
Feature: Direct Message - Share Internal Article

  Scenario: Verify Sharing Internal Article via DM Functionality
    Given I sign in to use the app
    And I tap on the "home" icon tab
    And I tap on the "dm inbox" icon from toolbar menu
    And I tap on "jumbojoefan2" textview
    And I scroll to "MLB"
    And I tap on "MLB" textview
    And I tap on "Bleacher Report" textview
    When I tap on the share DM button
    And I search for my friend "ianburn4"
    And I tap on "ianburn4" textview
    Then I tap on the "Send" button
    And I navigate back using device back button
    And I navigate back using device back button
    And I navigate back using device back button
    And I navigate back using device back button
    And I sign out to clear the device