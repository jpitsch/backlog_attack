require "httparty"
require "json"

class ApplicationController < ActionController::API
  def index
    authUri = 'https://id.twitch.tv/oauth2/token'
    params = { 
      :client_id => 'zj915m745gg7olqj6ez5dnm5ttq2rk', 
      :client_secret => 'dn2w20beo260v8yablxzv9w8b860ra', 
      :grant_type => 'client_credentails' 
    }

    response = HTTParty.post(
      'https://id.twitch.tv/oauth2/token?client_id=zj915m745gg7olqj6ez5dnm5ttq2rk&client_secret=dn2w20beo260v8yablxzv9w8b860ra&grant_type=client_credentials'
    )

    access_token = JSON.parse(response.body)['access_token']

    puts access_token

    api_endpoint = 'https://api.igdb.com/v4/games/'
    request_headers = { 
      headers: { 
        'client-id' => 'zj915m745gg7olqj6ez5dnm5ttq2rk', 
        'authorization' => 'Bearer 7g3vqslshaczn7sooe26nkidmlgfd3' 
      }
    }
      
    render json: { message: "Hello and welcome to Backlog Attack!" }
  end
end
