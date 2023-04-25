# frozen_string_literal: true
module SpotifyApi
  class SpotifyEndpoint < ApplicationService
    include HTTParty

    base_uri 'https://api.spotify.com/v1'

    CLIENT_ID = '36bd252fec5d4b3481dd9f121239332a'
    CLIENT_SECRET = 'dfce24e1bf954493a03d99e0e9fbb71e'

  end

end