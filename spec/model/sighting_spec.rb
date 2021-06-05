require 'rails_helper'

RSpec.describe Sighting do
  describe 'validations' do
    it { should validate_presence_of(:user).with_message('must exist') }
    it { should validate_presence_of(:flower).with_message('must exist') }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:flower) }
    it { should have_many(:likes) }

    it { should have_db_index(:user_id) }
    it { should have_db_index(:flower_id) }

    describe 'dependecies' do
      context 'when destroying' do
        let(:sighting) { create(:sighting) }

        it 'should destroy all likes' do
          create_list(:like, 1, sighting: sighting)
          expect { sighting.destroy }.to change { Like.count }.by(-1)
        end
      end
    end
  end
end
