class RemoveHeldOnFromConcerts < ActiveRecord::Migration[6.1]
  def change
    remove_column :concerts, :held_on, :date
  end
end
