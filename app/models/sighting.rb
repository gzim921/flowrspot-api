class Sighting < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  belongs_to :flower
  validates :image, attached: false
  has_many :likes, dependent: :destroy
end
