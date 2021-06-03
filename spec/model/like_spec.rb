require 'rails_helper'

RSpec.describe Like do
  describe 'validations' do
    context 'presence' do
      it { should validate_presence_of(:user).with_message("must exist")}
      it { should validate_presence_of(:sighting).with_message("must exist") }
    end

    context 'when trying to like the same sighting' do
      let(:user) { create(:user) }
      let(:sighting) { create(:sighting) }
      let(:like) { create(:like,user: user,sighting: sighting) } 

      it 'should not allow to create like from the same user to same sight' do
        like
        like2 = build(:like, user: user,sighting: sighting)

        expect(like2.valid?).to be false
      end
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:sighting) }

    it { should have_db_index(:user_id) }
    it { should have_db_index(:sighting_id) }
  end
end
