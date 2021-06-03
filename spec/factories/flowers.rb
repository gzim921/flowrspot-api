FactoryBot.define do
  factory :flower do
    name { 'Marijuana' }
    description  { 'The best' }
    image { File.new(Rails.root.join('app', 'assets', 'images', 'flw1.png')) }
  end
end
