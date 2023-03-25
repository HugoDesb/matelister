class LinkMatelistAndUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :matelists, :user, foreign_key: true
  end
end
