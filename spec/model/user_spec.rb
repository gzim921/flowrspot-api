require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should have_secure_password }

    it { should validate_confirmation_of(:password) }

    context 'when testing presence' do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:password) }
    end
  end
  describe 'associations' do
    it { should have_many(:sightings) }
    it { should have_many(:likes) }

    describe 'dependecies' do
      context 'when destroying' do
        let(:user) { create(:user) }

        it 'should destroy all sightings' do
          create_list(:sighting, 1, user: user)
          expect { user.destroy }.to change { Sighting.count }.by(-1)
        end

        it 'should destroy all likes' do
          create_list(:like, 1, user: user)
          expect { user.destroy }.to change { Like.count }.by(-1)
        end
      end
    end
  end
end
