require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:users) { create_list(:user, 5) }

  describe 'GET /users' do
    before { get '/api/users' }

    it 'returns user data' do
      expect(JSON.parse(response.body)["data"].size).to eq(5)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    let(:user_id) { users.first.id }

    context 'when existing ID is used' do
      before { get "/api/users/#{user_id}" }

      it 'will return a response with 200 status code' do
        expect(response).to have_http_status(200)
      end

      it 'will return the correct user' do
        expect(JSON.parse(response.body)['id']).to eq(user_id)
      end
    end
  end

  describe 'PATCH /users/:id' do
    let(:update_id) { users.first.id }
    let(:user_update_params) do 
      { user_name: 'UpdatedUser' }
    end

    context 'when user exists' do
      before { patch "/api/users/#{update_id}", params: user_update_params }

      it 'updates the record' do
        updated = User.find(update_id)
        expect(updated.user_name).to match('UpdatedUser')
      end
    end
  end

  describe 'DELETE /users/:id' do
    let(:delete_id) { users.first.id }

    context 'when existing ID is used' do
      before { delete "/api/users/#{delete_id}" }

      it 'will delete the record' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
