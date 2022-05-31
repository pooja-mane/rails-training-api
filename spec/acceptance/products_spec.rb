require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Products" do
  let(:user1) { create(:user, email: 'testuser1@test.com') }
  let(:auth_header) { user1.create_new_auth_token }

  before do
    header 'access-token', auth_header['access-token']
    header 'token-type', auth_header['token-type']
    header 'uid', auth_header['uid']
    header 'client', auth_header['client']
    header 'Content-Type', 'application/json'
  end

  get "/api/v1/products" do
    example "Listing products" do
      do_request

      expect(status).to eq 200
    end
  end
end