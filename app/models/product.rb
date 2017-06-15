class Product < ApplicationRecord
  validates :name, presence: true
  has_many :orders
  has_many :comments

  def self.search(search_term, is_production)
  	if is_production
  	  Product.where("name ilike ?", "%#{search_term}%")
    else 
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end
  
  # Returns the highest rated comment for the current product.
  def highest_rating_comment
    comments.rating_desc.first
  end 

  # Returns the lowest rated comment for the current product.
  def lowest_rating_comment
    comments.rating_asc.first
  end 

  # Returns an array of all of the five star comments for the current product
  def five_star_comments
    comments.five_star_comments
  end
  
  # Returns an array of all of the one star comments for the current product
  def one_star_comments
    comments.one_star_comments
  end

  def average_rating
    comments.average(:rating).to_f
  end
  
  # returns the number of views for the product
  def views
    $redis.get("product:#{id}")
  end

  # processes a product view
  def viewed!
    $redis.incr("product:#{id}")
  end

end

