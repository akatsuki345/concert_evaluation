class AddConcertIdToCartItems < ActiveRecord::Migration[6.1]
  def change
    # add_column :cart_items, :concert_id, :integer
    add_reference :cart_items, :concert, foreign_key: true
  end
end
