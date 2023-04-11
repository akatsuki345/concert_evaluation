class AddCategoryIdToConcerts < ActiveRecord::Migration[6.1]
  def change
    add_column :concerts, :category_id, :integer
  end
end
