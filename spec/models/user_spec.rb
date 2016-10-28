require 'rails_helper'

describe User do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        user = build(:user, name:nil)
        expect(user).to  be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with name" do
        user = build(:user)
        expect(user).to be_valid
      end
    end
  end

  describe "Relationships" do
    it "has many ideas" do
      user = build(:user)

      expect(user).to respond_to(:ideas)
    end
  end

  describe "#role" do
    it 'can return admin' do
      user = User.create(name: "Sal", email: "sal@sal.com", password: "123", password_confirmation: "123", role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it 'can return default' do
      user = User.create(name: 'Penelope', email: "p@gmail.com", password: "123", password_confirmation: '123')

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end
  end
end
