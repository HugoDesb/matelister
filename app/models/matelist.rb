class Matelist < ApplicationRecord
  belongs_to :user
  has_many :invites
  has_many :playlists

end
