require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      @product = FactoryGirl.create(:product)
      FactoryGirl.create(:comment, product: @product, rating: 5)
      FactoryGirl.create(:comment, product: @product, rating: 3)
      FactoryGirl.create(:comment, product: @product, rating: 1)
    end
    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end
    it "is not valid" do
      expect(FactoryGirl.build(:product, name: nil)).not_to be_valid 
    end
  end 
end 