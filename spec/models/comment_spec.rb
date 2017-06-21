require 'rails_helper'

describe Comment do
  context "when paginating comments" do
    it "returns 5 results per page" do
      expect(Comment.per_page).to eq 5
    end
  end
  context "when generating a comment" do
    it "is not valid to skip rating" do
      expect(FactoryGirl.build(:comment, rating: nil)).not_to be_valid
    end
    it "is not valid to skip comment" do
      expect(FactoryGirl.build(:comment, body: nil)).not_to be_valid
    end
    it "is not valid to not be associated with a product" do
      expect(FactoryGirl.build(:comment, product: nil)).not_to be_valid
    end
    it "is not valid to not be associated with a user" do
      expect(FactoryGirl.build(:comment, user: nil)).not_to be_valid
    end
  end
end
