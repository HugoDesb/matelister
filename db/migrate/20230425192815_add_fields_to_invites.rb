class AddFieldsToInvites < ActiveRecord::Migration[7.0]
  def change
    add_column :invites, :status, :string
    add_column :invites, :code, :string
    remove_column :invites, :otp
  end
end
