class Like < ApplicationRecord
  belongs_to :user
  belongs_to :sighting

  validates :sighting, uniqueness: { scope: :user}
end
