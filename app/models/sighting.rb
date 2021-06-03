class Sighting < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  belongs_to :flower

  has_many :likes
end
