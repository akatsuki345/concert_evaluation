class OrderDetail < ApplicationRecord
  belongs_to :concert
  belongs_to :order

  enum making_status: {tyakusyuhuka: 0, tyakusyumati: 1, hassoutyuu: 2, hassoukanryou: 3 }
  def add_total_payment_all
    tax = 1.1
    (self.concert.price * tax).floor * self.sheet
  end
end
