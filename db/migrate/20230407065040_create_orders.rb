class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :concert_id
      t.integer :sheet
      t.integer :status
      t.integer :payment_method
      t.integer :total_payment
      t.string :name
      t.string :address
      t.string :postal_code

      t.timestamps
    end
  end
end
