@applitools
Feature: Legal Links

  Scenario: Navigate to Legal Content UI
    Given I navigate to the "home" tab
    And I tap on the "settings" icon from toolbar menu
    And I scroll to "Community Guidelines"
    And I tap on "Terms of Use" textview
    Then the "Terms of Use" screen is displayed
    And I tap on the navigate back button
    And I tap on "Privacy Policy" textview
    Then the "Privacy Policy" screen is displayed
    And I tap on the Close button
    And I tap on "Licenses" textview
    Then the "Licenses" screen is displayed
    And I tap on the navigate back button
    And I tap on "Community Guidelines" textview
    Then the "Community Guidelines" screen is displayed