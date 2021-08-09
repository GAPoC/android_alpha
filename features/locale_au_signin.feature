@au_regression
Feature: AU Locale - Sign In

  Scenario: Verify AU - Settings Sign In Functionality and UI
    Given the "AU Welcome" screen is displayed
    And I accept the GDPR rules by default
    When I navigate to the "home" tab
    Then I tap on the "settings" icon from toolbar menu
    And I sign in through settings for "non-US" locales
    Then the "AU Locale - Settings" screen is displayed
    And I navigate back using device back button
    And the "*New* Video Posts 📽" social promo is "shown"
    Then I tap on the "my br" icon tab
    Then the "AU  Locale - My BR" screen is displayed
    And I sign out to clear the device