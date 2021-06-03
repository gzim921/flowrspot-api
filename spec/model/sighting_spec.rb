require 'rails_helper'

RSpec.describe Sighting do
  describe 'validations' do
    it { should validate_presence_of(:user).with_message('must exist') }
    it { should validate_presence_of(:flower).with_message('must exist') }

    it { is_expected.to validate_attached_of(:image) }
    it { is_expected.to validate_content_type_of(:image).allowing('image/png', 'image/jpg', 'image/jpeg') }
  end

  describe 'associations' do
    it { should belong_to(:user)}
    it { should belong_to(:flower)}
    it { should have_many(:likes)}

    it { should have_db_index(:user_id) }
    it { should have_db_index(:flower_id) }
  end
end
