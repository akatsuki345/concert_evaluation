class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.integer :concert_id, null: false
      t.integer :order_id, null: false
      t.integer :sheet, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
