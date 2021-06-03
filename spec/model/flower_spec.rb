require 'rails_helper'

RSpec.describe Flower do
  describe 'validations' do
    it { is_expected.to validate_content_type_of(:image).allowing('image/png', 'image/jpg', 'image/jpeg') }
  end

  describe 'associations' do
    it { should have_many(:sightings) }

    describe 'dependecies' do
      context 'when destroying' do
        let(:flower) { create(:flower) }

        it 'should destroy all sightings' do
          create_list(:sighting, 1, flower: flower)
          expect { flower.destroy }.to change { Sighting.count }.by(-1)
        end
      end
    end
  end
end
