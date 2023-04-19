class AddHeldOnToConcerts < ActiveRecord::Migration[6.1]
  def change
    add_column :concerts, :held_on, :date
  end
end
