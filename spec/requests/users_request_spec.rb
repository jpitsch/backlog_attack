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

  describe 'POST /users' do
    let(:valid_params) do 
      { user_name: 'MyUser', email: 'test@example.com' }
    end

    context 'when using valid params' do
      before { post '/api/users', params: valid_params }

      it 'returns 201 created status code' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
