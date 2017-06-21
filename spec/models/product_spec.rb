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
    it "returns the highest_rating_comment" do
      expect(@product.highest_rating_comment.rating).to eq 5
    end
    it "returns the lowest_rating_comment" do
      expect(@product.lowest_rating_comment.rating).to eq 1
    end
    it "returns the five_star_comments" do
      expect(@product.five_star_comments[0].rating).to eq 5
      expect(@product.five_star_comments.count).to eq 1
    end
    it "returns the one_star_comments" do
      expect(@product.one_star_comments[0].rating).to eq 1
      expect(@product.one_star_comments.count).to eq 1
    end
  end 
  context "when the product has no comments" do
    before do
      @product = FactoryGirl.create(:product)
    end
    it "returns a zero average rating" do
      expect(@product.average_rating).to eq 0
    end
  end
  context "when there are multiple products" do
    before do
      @product = FactoryGirl.create(:product)
      @product2 = FactoryGirl.create(:product)
      @product3 = FactoryGirl.create(:product, name: "test")
    end
    it "returns the right number of search results" do
      expect(Product.search("test", false).count).to eq 1
    end
  end
end 