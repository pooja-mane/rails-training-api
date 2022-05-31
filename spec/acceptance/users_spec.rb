require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Users" do
  let(:user1) { create(:user, email: 'testuser1@test.com') }
  let!(:user2) { create(:user, email: 'testuser2@test.com') }
  
  let(:auth_header) { user1.create_new_auth_token }

  before do
    header 'access-token', auth_header['access-token']
    header 'token-type', auth_header['token-type']
    header 'uid', auth_header['uid']
    header 'client', auth_header['client']
    header 'Content-Type', 'application/json'
    # header 'accept', 'application/vnd.tpl-iot.in; version=1'
  end

  get "/api/v1/users" do
    example "Listing Users" do
      do_request

      expect(status).to eq 200
    end
  end
end