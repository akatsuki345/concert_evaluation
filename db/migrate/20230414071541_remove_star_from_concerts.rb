class RemoveStarFromConcerts < ActiveRecord::Migration[6.1]
  def change
    remove_column :concerts, :star, :integer
  end
end
