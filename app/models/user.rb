class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable,
         :omniauthable, omniauth_providers: %i[deezer spotify]

  has_many :matelists

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|

      if auth.provider.to_sym == :deezer
        user.access_token = auth.credentials.token
        user.expires = auth.credentials.expires
        user.expires_at = auth.credentials.expires_at
      elsif auth.provider.to_sym == :spotify
        user.access_token = auth.credentials.token
        user.refresh_token = auth.credentials.refresh_token
        user.expires = auth.credentials.expires
        user.expires_at = auth.credentials.expires_at
      end

      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name
      user.image = auth.info.image
      user.nickname = auth.info.nickname
      user.email = auth.info.email
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
