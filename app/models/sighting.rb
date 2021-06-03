class Sighting < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  belongs_to :flower
  validates :image, attached: false, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  has_many :likes, dependent: :destroy
end
