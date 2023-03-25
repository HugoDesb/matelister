class RemoveEncryptedPwd < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :encrypted_password
  end
end
