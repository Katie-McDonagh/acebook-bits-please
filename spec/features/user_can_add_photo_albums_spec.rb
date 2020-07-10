RSpec.feature 'Timeline', type: :feature do
  before(:each) do
    # Capybara.current_driver= :selenium
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
    click_link "Profile"
  end

   scenario 'Finds a link to add a photo album' do
    expect(page).to have_link("Add Photo Album")
   end

end 
