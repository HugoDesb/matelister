module SpotifyApi
  class RefreshToken < SpotifyEndpoint

    base_uri 'https://accounts.spotify.com'
    def initialize(user)
      @user = user
    end

    def call
      body = {
        'grant_type' => 'refresh_token',
        'refresh_token' => @user.refresh_token
      }
      auth = Base64.strict_encode64("#{CLIENT_ID}:#{CLIENT_SECRET}")
      response = self.class.post('/api/token',
                                 body: body,
                                 headers: {
                                   'Authorization' => "Basic  #{auth}",
                                   'Content-Type' => 'application/x-www-form-urlencoded'
                                 })

      parsed = response.parsed_response
      @user.access_token = parsed['access_token']
      @user.expires_at = Time.now + parsed['expires_in'].to_i.seconds
      @user.save
      @user

    end
  end
end
