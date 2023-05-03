class RmInvite < ActiveRecord::Migration[7.0]
  def change
    drop_table :invites
  end
end
