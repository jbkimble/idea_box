require 'rails_helper'

describe "User can login" do
  scenario "existing user can log into app" do
    user = User.create(name: "J", email: "J@gmail.com", password: "123")
    visit login_path

    within("form") do
      fill_in 'Email', with: "J@gmail.com"
      fill_in 'Password', with: "123"
      click_on "Login"
    end

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome J")
    expect(page).to have_content("Logout")
  end

end
