class RemoveUnusedFieldsUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :reset_password_token
    remove_column :users, :remember_created_at
  end
end
