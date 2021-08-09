Feature: Composer - Image Preview

	@regression @TEST_BRUTE-111
	Scenario: Verify user can preview an image
		Given I sign in to use the app
		When I tap on the "Post" button
		And the media button is displayed
		Then I enter "image" post
		Then I tap on close "image"
		Then I tap cancel on post composer entry
		And Dismiss "Discard Post" alert by clicking "YES"
		Then I sign out to clear the device
