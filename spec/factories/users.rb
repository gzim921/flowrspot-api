FactoryBot.define do
  factory :user do
    username { 'John' }
    email  { 'john@gmail.com' }
    password { 'john123' }
    password_confirmation { 'john123' }
  end
end
