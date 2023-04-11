class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :concert
  validates :sheet, presence: true

  def add_total_payment_all
    tax = 1.1
    (self.concert.price * tax).floor * self.sheet
  end
end
