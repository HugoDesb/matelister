class RemoveUniqueMail < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, column: :email
  end
end
