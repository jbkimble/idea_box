require 'rails_helper'

describe "User creates a new idea" do
  scenario "a user can create a new idea" do
    user = User.create(name: "Jon", password: "123")
    cat1 = Category.create(name: "Fun")

    visit new_user_idea_path(user)

    fill_in "Title", with: "Carve a birthday cake masterpiece!"
    fill_in "Description", with: "nuf' said"
    fill_in "Notes", with: "Chocolate cake!"

    click_button "Create"

    expect(current_path).to eq("/users/#{user.id}/ideas/#{Idea.last.id}")
    expect(page).to have_content("Carve a birthday cake masterpiece!")
    expect(page).to have_content("nuf' said")
    expect(page).to have_content("Chocolate cake!")
  end
end
