class RemoveLastNameFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :last_name, :string
  end
end
