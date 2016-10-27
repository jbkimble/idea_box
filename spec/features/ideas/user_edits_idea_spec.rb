require 'rails_helper'

describe "User edits idea" do
  scenario "user can edit an idea" do
    user = User.create(name: "Jon", password: "123")
    cat1 = Category.create(name: "Fun")

    visit new_user_idea_path(user)

    fill_in "Title", with: "Carve a birthday cake masterpiece!"
    fill_in "Description", with: "nuf' said"
    fill_in "Notes", with: "Chocolate cake!"

    click_button "Create"
    click_link "Edit"

    fill_in "Title", with: "Relax"
    fill_in "Description", with: "peaceful"
    fill_in "Notes", with: "ommmm"

    click_button "Create"

    expect(current_path).to eq("/users/#{user.id}/ideas/#{Idea.last.id}")
    expect(page).to_not have_content("Carve a birthday cake masterpiece!")
    expect(page).to_not have_content("nuf' said")
    expect(page).to_not have_content("Chocolate cake!")

    expect(page).to have_content("Relax")
    expect(page).to have_content("peaceful")
    expect(page).to have_content("ommmm")
  end
end
