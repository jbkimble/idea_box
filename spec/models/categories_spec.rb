require 'rails_helper'

describe Category do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        cat = Category.new(name: nil)

        expect(cat).to be_invalid
      end
    end

    context "Valid attributes" do
      it "is valid with a title" do
        cat = Category.new(name: "Fishing")

        expect(cat).to be_valid
      end
    end
  end

  describe "Associations" do
    it "has multiple ideas" do
      cat = Category.create(name: "Adventures")
      cat.ideas.create(title: "One idea")
      cat.ideas.create(title: "Two idea")

      expect(cat.ideas.first.title).to eq("One idea")
      expect(cat.ideas.last.title).to eq("Two idea")

    end
  end
end
