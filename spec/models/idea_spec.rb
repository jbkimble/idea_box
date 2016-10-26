require 'rails_helper'

describe Idea do
  describe "Validations" do
    context "Invalid attributes" do
      it "is invalid without title" do
        user = create(:user)
        idea = user.ideas.new(title: nil)

        expect(idea).to be_invalid
    end
  end

    context "Valid attributes" do
      it "is valid with a title" do
        user = create(:user)
        cat = Category.create(name: "Fun")
        idea = user.ideas.new(title: "Best idea ever", category_id: cat.id)

        expect(idea).to be_valid
      end
    end
  end

  describe "Relationships" do
    it "has one user" do
      user = User.create(name: "Jon")
      idea = user.ideas.new(title: "Best idea ever")

      expect(idea.user.name).to eq("Jon")
    end

    it "has one category" do
      cat = Category.create(name: "Fun")
      idea = Idea.new(title: "Best idea ever", category_id: cat.id)

      expect(idea.category.name).to eq("Fun")
    end

    it "has many images" do
      user = User.create(name: "Jon")
      idea = user.ideas.new(title: "Best idea ever")

      expect(idea).to respond_to(:images)
    end
  end

end
