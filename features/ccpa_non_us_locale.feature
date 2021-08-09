Feature: Non-CCPA - EU Locales

  @uibug_Android-2170
  Scenario: Verify CCPA is not shown in Non-US Settings - BE Locale
    Given I accept the GDPR rules by default
    When I navigate to the "home" tab
    Then I tap on the "settings" icon from toolbar menu
    And  I scroll to "Send Feedback"
    Then the "Do Not Sell My Personal Information" is not displayed

  @uk_regression
  Scenario: Verify CCPA is not shown in Non-US Settings - UK Locale
    Given I accept the GDPR rules by default
    When I navigate to the "home" tab
    Then I tap on the "settings" icon from toolbar menu
    And  I scroll to "Send Feedback"
    Then the "Do Not Sell My Personal Information" is not displayed