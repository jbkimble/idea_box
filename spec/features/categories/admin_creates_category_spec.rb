require 'rails_helper'

describe "Admin can create category" do
  scenario "Admin can create a new category" do
    admin = User.create(name: "Arnold", email: "a@gmail.com", password: "123", password_confirmation: "123", role: 1)
    visit login_path

    within("form") do
      fill_in 'Email', with: "a@gmail.com"
      fill_in 'Password', with: "123"
      click_on "Login"
    end

    visit admin_categories_path
    click_on "Add Category"

    fill_in "Name", with: "Cooking"
    click_on "Create"

    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content("Cooking")
  end
end
