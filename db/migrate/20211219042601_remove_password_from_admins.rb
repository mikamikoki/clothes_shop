class RemovePasswordFromAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :password, :string
  end
end
