require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user1) { create(:user, email: 'testuser1@test.com') }
  let!(:user2) { create(:user, email: 'testuser2@test.com') }
  let!(:user3) { create(:user, email: 'testuser3@test.com') }
  
  let(:auth_header) { user1.create_new_auth_token }

  describe 'GET #index' do
    context 'when user is logged in' do
      it 'returns http success' do
        request.headers.merge! auth_header
        get :index
        json_response = JSON.parse(response.body)
        expect(response).to have_http_status(:success)
        expect(json_response['data'].count).to eq 3
      end
    end

    context 'when user is not logged in' do
      it 'returns unauthorized' do
        get :index
        json_response = JSON.parse(response.body)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end