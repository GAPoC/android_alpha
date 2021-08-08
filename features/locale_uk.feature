@uk_regression
Feature: UK Locale

  Scenario: Verify UK - GDPR flow UI
    Given the "GDPR - Inital Screen" screen is displayed
    And I tap on the "Manage Data Settings" button
    Then the "GDPR - Data Settings" screen is displayed
    And I tap on the "action next" button
    Then the "GDPR - Terms and Conditions" screen is displayed
    And I tap on the "Accept and Save Settings" button
    Then the "GDPR - Pick Teams" screen is displayed

  Scenario: Verify UK - GDPR Add Teams Functionality
    Given I accept the GDPR rules by default
    When I navigate to the "my br" tab
    Then I tap on the add button from my teams
    And I search for "UK Betting"
    And I tap on the "done" button
    Then the 'UK Betting' I added is displayed in my teams

  Scenario: Verify UK - Post Composer Not Shown
    Given I accept the GDPR rules by default
    When I navigate to the "home" tab
    Then the "UK - Home Feed" screen is displayed
    When I tap on the "my br" icon tab
    Then the "UK - My BR - Signed Out" screen is displayed