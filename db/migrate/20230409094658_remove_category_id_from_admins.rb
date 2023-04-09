class RemoveCategoryIdFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :category_id, :integer
  end
end
