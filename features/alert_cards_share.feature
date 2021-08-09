Feature: Alert Cards - Share Icon

  @applitools
  Scenario: Tapping on the Share Icon from Alerts
    Given I navigate to the "alerts" tab
    And I tap on the "share" icon from the alert
    Then the "Share this Article" screen is displayed