class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :concert
  validates :sheet, presence: true

  def add_total_payment_all
    concert.add_tax_price * sheet
  end
end
