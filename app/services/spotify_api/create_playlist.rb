module SpotifyApi
  class CreatePlaylist < ApplicationService
    include HTTParty
    base_uri "https://api.spotify.com/v1"

    def initialize(title, user)
      @title = title
      @user = user
    end

    def call
      body = { "name" => @title }.to_json
      self.class.post("/users/#{@user.uid}/playlists",
                      body: body,
                      headers: {
                        "Authorization" => "Bearer #{@user.access_token}",
                        'Content-Type' => 'application/json'
                      })
    end

  end
end
