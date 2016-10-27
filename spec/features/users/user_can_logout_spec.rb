require 'rails_helper'

describe "User can log out" do
  scenario "A logged in user can log out" do
    user = User.create(name: "J", email: "J@gmail.com", password: "123")
    visit login_path

    within("form") do
      fill_in "Email", with: "J@gmail.com"
      fill_in "Password", with: "123"
      click_on "Login"
    end
    click_on "Logout"

    expect(page).to have_content("Successfully logged out!")
    expect(page).to have_content("Login")
  end
end
