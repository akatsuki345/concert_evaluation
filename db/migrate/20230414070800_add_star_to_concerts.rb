class AddStarToConcerts < ActiveRecord::Migration[6.1]
  def change
    add_column :concerts, :star, :integer
  end
end
