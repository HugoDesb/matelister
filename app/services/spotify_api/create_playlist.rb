module SpotifyApi
  class CreatePlaylist < SpotifyEndpoint

    def initialize(title, user)
      @title = title
      @user = user
    end


    def call
      @user = refresh_token_if_necessary
      body = { 'name' => @title }.to_json
      self.class.post("/users/#{@user.uid}/playlists",
                      body: body,
                      headers: {
                        'Authorization' => "Bearer #{@user.access_token}",
                        'Content-Type' => 'application/json'
                      })
    end

    def refresh_token_if_necessary
      if @user.has_expired?
        @user = SpotifyApi::RefreshToken.call(@user)
      else
        @user
      end
    end

  end
end
