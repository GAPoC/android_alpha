Feature: My BR - Remove Teams

  @regression
  Scenario: Removing All Teams - Signed Out
    Given I navigate to the "my br" tab
    When I tap on the "Manage Streams" icon from toolbar menu
    Then I remove all the teams I've added from my teams
    And I tap on the save button
    Then the "Welcome" screen is displayed

  @ANDROID-2274
  Scenario: Removing All Teams - Signed In
    Given I sign in to use the app
    When I tap on the "my br" icon tab
    When I tap on the "Manage Streams" icon from toolbar menu
    Then I remove all the teams I've added from my teams
    And I tap on the save button
    Then the "Welcome - Sign Out" screen is displayed
    And I tap on the "Sign Out" button
    And Dismiss "Confirm Sign Out" alert by clicking "SIGN OUT"
    Then the button "Pick Teams" is displayed