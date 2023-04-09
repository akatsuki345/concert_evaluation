class AddCategoryIdToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :category_id, :integer
  end
end
