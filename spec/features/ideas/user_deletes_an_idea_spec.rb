require 'rails_helper'
  describe "User deletes an existing idea" do
    scenario "a user can delete an idea " do
        user = User.create(name: "Jon", password: "123")
        cat1 = Category.create(name: "Fun")

        visit new_user_idea_path(user)

        fill_in "Title", with: "Carve a birthday cake masterpiece!"
        fill_in "Description", with: "nuf' said"
        fill_in "Notes", with: "Chocolate cake!"

        click_button "Create"
        click_link "Delete"

        expect(current_path).to eq(user_ideas_path(user))
        save_and_open_page
        expect(page).to_not have_content("Carve a birthday cake masterpiece!")
      end

    end
#   end
