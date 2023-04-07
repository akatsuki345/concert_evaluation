class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.integer :genre_id
      t.boolean :is_active,default:true
      t.string :name
      t.text :introduction
      t.integer :price

      t.timestamps
    end
  end
end
