class Flower < ApplicationRecord
  has_one_attached :image
  validates :image, attached: false, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  has_many :sightings, dependent: :destroy
end
