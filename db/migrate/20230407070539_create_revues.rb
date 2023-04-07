class CreateRevues < ActiveRecord::Migration[6.1]
  def change
    create_table :revues do |t|
      t.integer :customer_id
      t.integer :concert_id
      t.text :impressions

      t.timestamps
    end
  end
end
