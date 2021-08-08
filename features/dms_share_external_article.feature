@FIXME_QA-8697 @BTEAM-1187
Feature: Direct Message - Share External Article

  Scenario: Verify Sharing External Article via DM Functionality
    Given I sign in to use the app
    And I tap on the "home" icon tab
    And I tap on the "dm inbox" icon from toolbar menu
    And I tap on "jumbojoefan2" textview
    And I scroll to "MLB"
    And I tap on "MLB" textview
    And I tap on "Bleacher Report" textview
    When I tap on the DM button in the external share bar
    And I search for my friend "ianburn4"
    And I tap on "Ian Rosenfield" textview
    Then I tap on the "Send" button
    And I navigate back using device back button
    And I navigate back using device back button
    And I navigate back using device back button
    And I navigate back using device back button
    And I sign out to clear the device