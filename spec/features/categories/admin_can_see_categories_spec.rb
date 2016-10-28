require 'rails_helper'

describe 'User visits the admin categories page' do
  context 'as an admin' do
    it 'the see Admin Categories' do
      admin = User.create(name: "A", email: "A@a.com", password: "123", password_confirmation: "123", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path
      expect(page).to have_content("Admin")
    end
  end

  context 'as a default user' do
    it 'they are shown a 404' do
      user = User.create(name: "A", email: "A@a.com", password: "123", password_confirmation: "123")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit admin_categories_path
      expect(page).to_not have_content("Admin Categories")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
