class AddCredentialsAndInfoForDeezer < ActiveRecord::Migration[7.0]
  def change
    change_table (:users) do |t|
      t.column :username, :string
      t.column :image, :string
      t.column :nickname, :string
      t.column :access_token, :string
      t.column :expires, :boolean
      t.column :expires_at, :datetime
    end
  end
end
