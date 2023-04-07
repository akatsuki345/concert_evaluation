class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :concert
end
