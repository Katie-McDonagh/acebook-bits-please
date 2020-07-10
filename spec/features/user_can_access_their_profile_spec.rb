RSpec.feature "User profile", type: :feature do
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

  scenario "finds a link to access personal profile" do
    expect(page).to have_link("My Profile")
  end 

  scenario "user can access their profile" do
    click_link "My Profile"
    expect(page).to have_content("Testfirstname Testlastname")
  end 
end

  