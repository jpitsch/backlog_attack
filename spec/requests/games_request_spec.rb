require 'rails_helper'

RSpec.describe 'Games', type: :request do
  let!(:games) { create_list(:game, 5) }
  let(:headers) do
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
  end

  describe 'GET /games' do
    before do
      get '/api/games'
    end

    it 'returns a list of games' do
      expect(JSON.parse(response.body)["data"].size).to eq(5)
      expect(response).to have_http_status(200)
    end
  end
end
