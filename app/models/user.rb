class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email, :username, :password

  has_many :sightings
  has_many :likes
end
