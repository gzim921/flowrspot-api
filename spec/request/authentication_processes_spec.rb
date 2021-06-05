equire 'rails_helper'

RSpec.describe "AuthenticationProcesses" do
  let(:user) { create(:user) }
  let(:token_new) { JWT.encode({user_id: user.id}, Rails.application.secrets.secret_key_base) }
  let(:token) do
    {  "Authorization": "Bearer #{token_new}"  }
  end

  describe 'loggin in and signing up' do
    it 'should login successfully' do 
      post '/login', params: { email: user.email, password: user.password }, headers: token

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(user.email)
      expect(response.body).to include(token_new)
    end

    it 'should register successfully' do
      post '/users', params: { user: { username: "test222",
                                            email: "test222@gmail.com",
                                            password: "test",
                                            password_confirmation: "test" } }

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'requesting flowers and sightings flower without logging in' do
    let!(:flower) { create(:flower) }
    let!(:sighting) { create(:sighting) }

    it 'should render all flowers and validate types' do
      get '/flowers'

      expect_json_types(flowers: :array_of_objects)
    end

    it 'should render flower and sightings and validate types' do
      get "/flowers/#{flower.id}/sightings"
      create_list(:sighting, 2, flower: flower)

      expect(response.body).to include(flower.name)
      expect_json_types(sightings: :array_of_objects)
    end
  end

  describe 'as a logged in user' do
    let!(:flower) { create(:flower) }
    let!(:sighting) { create(:sighting) }

    it 'can create sighting' do
      post "/flowers/#{flower.id}/sightings", params: { logitude: 12.111111,
                                            latitude: 23.123123,
                                            question: 'Nothing to worry about?' }, headers: token

      expect(response).to have_http_status(:ok)
      expect_json_types(sightings: :array_of_objects)
    end

    it 'can like a sighting' do
      post "/sightings/#{sighting.id}/likes", headers: token

      expect(response.body).to be_json.with_content({ note: 'Sighting liked successfully!' })
    end

    context 'when destroying' do
      it 'cannot destroy others sightings' do
        delete "/flowers/#{flower.id}/sightings/#{sighting.id}", headers: token

        expect(response.body).to be_json.with_content({ note: 'You dont have permission!!' })
      end

      it 'can destroy only his/her sightings' do
        sighting = create(:sighting, user: user, flower: flower)
        delete "/flowers/#{flower.id}/sightings/#{sighting.id}", headers: token

        expect(response.body).to be_json.with_content({ note: 'Destroyed successfully!' })
      end

      it 'cannot destroy others likes' do
        like = create(:like, sighting: sighting)
        delete "/sightings/#{sighting.id}/likes/#{like.id}", headers: token

        expect(response.body).to be_json.with_content({ note: 'Something went wrong!!' })
      end

      it 'can destroy only his/her likes' do
        like = create(:like, sighting: sighting, user: user)
        delete "/sightings/#{sighting.id}/likes/#{like.id}", headers: token

        expect(response.body).to be_json.with_content({ note: 'You disliked this sighting!' })
      end
    end
  end
end
