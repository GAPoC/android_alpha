@applitools
Feature: My Profile - Settings Flow

  Scenario: Tapping on My Profile - Signed In
    Given I sign in to use the app
    When I tap on the "settings" icon from toolbar menu
    Then I tap on "My Profile" textview
    Then the "My Profile - Signed In" screen is displayed

  Scenario: Tapping on My Profile  - Signed Out
    Given I navigate to the "home" tab
    When I tap on the "settings" icon from toolbar menu
    Then the "Settings - Signed Out" screen is displayed