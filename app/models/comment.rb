class Comment < ApplicationRecord
  validates :user, presence: true
  validates :body, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

  belongs_to :user
  belongs_to :product
  
  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }
  scope :five_star_comments, -> { where("rating == 5")}
  scope :one_star_comments, -> { where("rating ==1")}
  
  # will_paginate comments per page
  def self.per_page
    5
  end

  def set_as_latest_five_star_comment(product, user)
    $redis.hset("latest_five_star_comment", "product", product.name)
    $redis.hset("latest_five_star_comment", "name", user.first_name)
    $redis.hset("latest_five_star_comment", "comment", body)
  end


end
