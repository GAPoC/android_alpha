@uk_regression
Feature: UK Locale - Sign In

  Scenario: Verify UK - Settings Sign In Functionality and UI
    Given the "UK Welcome" screen is displayed
    And I accept the GDPR rules by default
    When I navigate to the "home" tab
    Then I tap on the "settings" icon from toolbar menu
    And I sign in through settings for "non-US" locales
    Then the "UK Locale - Settings" screen is displayed
    And I navigate back using device back button
    Then I tap on the "my br" icon tab
    Then the "UK  Locale - My BR" screen is displayed
    And I sign out to clear the device