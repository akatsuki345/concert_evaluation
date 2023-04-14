class AddStarToRevues < ActiveRecord::Migration[6.1]
  def change
    add_column :revues, :star, :integer
  end
end
