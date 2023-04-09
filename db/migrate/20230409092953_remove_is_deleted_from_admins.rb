class RemoveIsDeletedFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :is_deleted, :boolean
  end
end
