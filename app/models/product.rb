class Product < ApplicationRecord
  has_many :orders

  def self.search(search_term, is_production)
  	if is_production
  	  Product.where("name ilike ?", "%#{search_term}%")
    else 
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end 
end

