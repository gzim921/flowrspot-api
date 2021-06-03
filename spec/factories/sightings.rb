FactoryBot.define do
  factory :sighting do
    longitude { 12.222333 }
    latitude { 11.333222 }
    user
    flower
  end
end
