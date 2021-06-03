FactoryBot.define do
  factory :sighting do
    longitude { 12.222333 }
    latitude { 11.333222 }
    user
    flower
    image { File.new(Rails.root.join('app', 'assets', 'images', 'flw1.png')) }
  end
end
