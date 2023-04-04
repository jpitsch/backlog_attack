require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:users) { create_list(:user, 5) }
  let(:headers) do
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
  end

  describe 'GET /users/:id' do
    let(:user_id) { users.first.id }
    let(:auth_user) { users.first }

    context 'when existing ID is used' do
      before do
        auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, auth_user)
        get "/api/users/#{user_id}", headers: auth_headers
      end

      it 'will return a response with 200 status code' do
        expect(response).to have_http_status(200)
      end

      it 'will return the correct user' do
        expect(JSON.parse(response.body)['data']['attributes']['id']).to eq(user_id)
      end
    end
  end

  describe 'PATCH /users/:id' do
    let(:user_id) { users.first.id }
    let(:auth_user) { users.first }
    let(:user_update_params) do 
      { 
        'user_name': 'UpdatedUser' 
      }
    end

    context 'when user exists' do
      before do
        auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, auth_user)
        patch "/api/users/#{user_id}", params: user_update_params.to_json, headers: auth_headers
      end

      it 'updates the record' do
        updated = User.find(user_id)
        expect(updated.user_name).to match('UpdatedUser')
      end
    end
  end

  describe 'DELETE /users/:id' do
    let(:delete_id) { users.first.id }
    let(:auth_user) { users.first }

    context 'when existing ID is used' do
      before do
        auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, auth_user)
        delete "/api/users/#{delete_id}", headers: auth_headers
      end

      it 'will delete the record' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
