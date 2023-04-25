module DeezerApi
  class CreatePlaylist < ApplicationService
    include HTTParty
    base_uri 'https://api.deezer.com'

    # @param [Object] title
    # @param [User]
    def initialize(title, user)
      @title = title
      @user = user
    end

    def call
      self.class.post('/user/me/playlists', { body: {
                        access_token: @user.access_token,
                        title: @title
                      } })
    end
  end
end
