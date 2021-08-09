Feature: Bet Center is not available for non North American users.

  @uk_regression @TEST_QA-4355
  Scenario: Verify that Bet Center is not available for UK region
    Given I accept the GDPR rules by default
    When I navigate to the "my br" tab
    Then the textview "Perfect Picks" is not displayed

  @be_regression @TEST_QA-4355
  Scenario: Verify that Bet Center is not available for BE region
    Given I accept the GDPR rules by default
    When I navigate to the "my br" tab
    Then the textview "Perfect Picks" is not displayed

  @au_regression @TEST_QA-4355
  Scenario: Verify that Bet Center is not available for AU region
    Given I accept the GDPR rules by default
    When I navigate to the "my br" tab
    Then the textview "Perfect Picks" is not displayed