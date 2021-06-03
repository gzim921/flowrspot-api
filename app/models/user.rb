class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email, :username, :password

  has_many :sightings, dependent: :destroy
  has_many :likes, dependent: :destroy
end
