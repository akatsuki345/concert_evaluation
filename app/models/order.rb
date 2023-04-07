class Order < ApplicationRecord

  belongs_to :customer
  has_many :concerts, dependent: :destroy

end
