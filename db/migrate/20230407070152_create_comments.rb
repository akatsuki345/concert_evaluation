class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :customer_id
      t.integer :concert_id
      t.integer :revue_id
      t.text :comment

      t.timestamps
    end
  end
end
