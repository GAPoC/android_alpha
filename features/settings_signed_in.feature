Feature: Settings - Signed In

  Background:
    Given I sign in to use the app
    And I tap on the "settings" icon from toolbar menu

  @regression
  Scenario: Verify Settings UI with Signed-In user
    Then I am redirected to the "Settings - Signed In" screen

  @regression
  Scenario: Verify Settings Screen with Signed In User
    Then the textview "My Preferences" is displayed
    And I tap on "Notification Details" textview
    Then the textview "Scores Notifications" is displayed
    Then I scroll to "Social Notifications"
    Then the textview "Social Notifications" is displayed
    Then I scroll to "Priority Notifications"
    Then the textview "Priority Notifications" is displayed
    Then I scroll to "Team Notifications"
    Then the textview "Team Notifications" is displayed
    Then I scroll to "Scores Notifications"
    And I tap on the navigate back button
    Then I scroll to "Community Guidelines"
    Then the button "Send Feedback" is displayed
    Then the textview "Terms of Use" is displayed
    Then the textview "Privacy Policy" is displayed
    Then the textview "Licenses" is displayed
    Then the textview "Community Guidelines" is displayed
    And I scroll to "Sign Out"
    Then the button "Sign Out" is displayed
    Then the mobile app version is shown