class Flower < ApplicationRecord
  has_one_attached :image

  has_many :sightings
end
