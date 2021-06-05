class Flower < ApplicationRecord
  has_one_attached :image
  validates :image, attached: false
  has_many :sightings, dependent: :destroy
end
