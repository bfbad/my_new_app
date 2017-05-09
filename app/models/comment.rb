class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }
  scope :five_star_comments, -> { where("rating == 5")}
  scope :one_star_comments, -> { where("rating ==1")}
end
