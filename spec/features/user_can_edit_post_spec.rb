require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before(:each) do
    visit "/"
    click_link "Sign Up"
    fill_in "user_firstname", with: "testfirstname"
    fill_in "user_lastname", with: "testlastname"
    fill_in "user_email", with: "test@gmail.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Create User"
    fill_in "email", with: "test@gmail.com"
    fill_in "password", with: "123456"
    click_button "Login"
  end

  scenario "Can edit posts" do
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_link "Edit"
    fill_in "Message", with: "Hello, world editted!"
    click_button "Submit"
    expect(page).to have_content("Hello, world editted!")
  end

  # Need sign out button
  scenario "Can't edit someone else's post" do
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
  click_link "Log out"
  click_link "Sign Up"
  fill_in "user_firstname", with: "test2firstname"
  fill_in "user_lastname", with: "testlastname"
  fill_in "user_email", with: "test2@gmail.com"
  fill_in "user_password", with: "123456"
  fill_in "user_password_confirmation", with: "123456"
  click_button "Create User"
  fill_in "email", with: "test2@gmail.com"
  fill_in "password", with: "123456"
  click_button "Login"

    expect(page).not_to have_link("Edit")
  end

end
