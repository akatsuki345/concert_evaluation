class RemoveContentFromConcerts < ActiveRecord::Migration[6.1]
  def change
    remove_column :concerts, :content, :text
  end
end
