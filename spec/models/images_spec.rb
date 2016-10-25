require 'rails_helper'

describe Images do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without url" do
        img = Image.new(url: nil)

        expect(img).to be_invalid
      end
    end
  end
end
