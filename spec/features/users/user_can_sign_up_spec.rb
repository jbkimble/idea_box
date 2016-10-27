require 'rails_helper'

describe "New user can sign up" do
  scenario "new user can visit page and sign up" do
    visit new_user_path

    fill_in "Name", with: "Jon"
    fill_in "Email", with: "J@gmail.com"
    fill_in "Password", with: "123"
    fill_in "Password confirmation", with: "123"
    click_on "Create User"

    expect(current_path).to eq(user_path(User.last))
    end
end
