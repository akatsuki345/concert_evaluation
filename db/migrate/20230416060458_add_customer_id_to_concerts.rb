class AddCustomerIdToConcerts < ActiveRecord::Migration[6.1]
  def change
    add_column :concerts, :customer_id, :integer
  end
end
