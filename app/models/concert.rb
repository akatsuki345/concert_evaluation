class Concert < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :revues, dependent: :destroy
  belongs_to :order
  belongs_to :customer

end
