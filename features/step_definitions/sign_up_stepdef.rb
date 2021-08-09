Given(/^I decide to sign up for an account$/) do
  navigate_all(:using => :nav_sign_up)
  hide_keyboard
end

When(/^I provide my first name$/) do
  fname = %w[Jennifer Carla Mary Jordan Mike Johnny]

  on(GlobalScreenElements).set_fname_txtfield("#{fname.sample}")
end

And(/^I provide my last name$/) do
  lname = %w[Doe Smith Johnson Richards Carlson]

  on(GlobalScreenElements).set_lname_txtfield("#{lname.sample}")
  ReusableFunction.wait_for(7)
end

And(/^I tap on the sign up with facebook or email link$/) do
  on(SignUpScreen).tap_fb_email_link
end

Then(/^I tap on the Sign up with email button$/) do
  on(SignUpScreen).tap_email_signup_btn
end

And(/^I provide my email to sign up$/) do
  on(SignInScreen).set_email_txtfield(ReusableFunction.generate_email)
end

And(/^I provide my password to sign up$/) do
  on(SignInScreen).set_pwd_txtfield(TestData.use_data('sign_up', 'password'))
end