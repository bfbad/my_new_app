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
  self.per_page=5
end
