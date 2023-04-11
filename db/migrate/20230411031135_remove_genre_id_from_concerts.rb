class RemoveGenreIdFromConcerts < ActiveRecord::Migration[6.1]
  def change
    remove_column :concerts, :genre_id, :integer
  end
end
