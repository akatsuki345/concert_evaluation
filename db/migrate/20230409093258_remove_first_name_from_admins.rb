class RemoveFirstNameFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :first_name, :string
  end
end
