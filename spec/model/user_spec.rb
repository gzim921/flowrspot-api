require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should have_secure_password }

    it { should validate_confirmation_of(:password) }

    context 'when testing presence'do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:password) }
    end
  end
  describe 'associations' do
    it { should have_many(:sightings) }
    it { should have_many(:likes) }
  end
end
