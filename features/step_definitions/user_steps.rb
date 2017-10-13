Given(/^there is a user with an email of abrfergus(\d+)@gmail\.com$/) do |email|
  @email = email
end

When(/^that user puts in their accurate user name and password$/) do
  visit(new_user_session_path)
  fill_in('user_email', :with => @email)
  fill_in('user_password', :with => "password")
  click_button('Log in')
end

Then(/^I should see logout$/) do
  expect(page).to have_link(destroy_user_session_path)
end

Then(/^they should be able to leave reviews\.$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
