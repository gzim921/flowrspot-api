require 'rails_helper'

RSpec.describe Flower do
  describe 'validations' do
    it { is_expected.to validate_attached_of(:image) }
    it { is_expected.to validate_content_type_of(:image).allowing('image/png', 'image/jpg', 'image/jpeg') }
  end

  describe 'associations' do
    it { should have_many(:sightings)}
  end
end
