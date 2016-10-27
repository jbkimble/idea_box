require 'rails_helper'

describe "User can see all ideas" do
  scenario "a user can see all their ideas" do
    user = User.create(name: "Jon", password: "123")
    cat = Category.create(name: "Fun")
    user.ideas.create(title: "bake", description: "cook", notes:"mmmm yum", category_id: cat.id)
    user.ideas.create(title: "run", description: "Workout", notes: "sweat", category_id: cat.id)

    visit user_ideas_path(user)

    expect(page).to have_content("bake")
    expect(page).to have_content("cook")
    expect(page).to have_content("mmmm yum")

    expect(page).to have_content("run")
    expect(page).to have_content("Workout")
    expect(page).to have_content("sweat")
  end
end
