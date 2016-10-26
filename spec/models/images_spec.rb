require 'rails_helper'

describe Images do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without url" do
        img = Image.new(url: nil)

        expect(img).to be_invalid
      end
    end

    context "valid with attributes" do
      it "is valid with url" do
        img = Image.new(url: "yayayyyaya.com")

        expect(img).to be_valid
      end
    end
  end

  # describe "Relationships" do
  #   it "can respond to ideas"
  # end
end
