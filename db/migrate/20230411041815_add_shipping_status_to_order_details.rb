class AddShippingStatusToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :shipping_status, :integer
  end
end
