class AddContentToConcerts < ActiveRecord::Migration[6.1]
  def change
    add_column :concerts, :content, :text
  end
end
