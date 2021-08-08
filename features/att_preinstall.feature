Feature: ATT Pre-install Flow - LP 1

  Background: Route new users to home stream
    Given the welcome screen is "bypassed"
    And I accept the GDPR rules by default
    Then the user is redirected to the home screen

  @testobject1_fixme
  Scenario: Pre-subscribed Streams
    Then the user is redirected to the home screen
    When I tap on the "my teams" icon tab
    Then I am following the pre-subscribed streams

    @todo
  Scenario: Breaking News notification enabled
    When I tap on the "settings" icon from toolbar menu
    Then breaking news is the only notification enabled