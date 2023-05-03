class Matelist < ApplicationRecord
  belongs_to :user
  has_many :playlists

end
