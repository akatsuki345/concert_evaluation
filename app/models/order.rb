class Order < ApplicationRecord

  enum payment_method: { credit_card: 0, transfer: 1 }

  attr_accessor :option, :address_id, :other_postal_code, :other_address, :other_name

  enum status: {
      waiting_for_payment: 0,
      payment_confirmation: 1,
      currently_shipping: 2,
      shopped: 3
    }
  validates :name, presence:true

  has_many :order_details,dependent: :destroy
  belongs_to :customer
  has_many :concerts, dependent: :destroy

  def add_full_address
    "#{self.postal_code} #{self.address} "
  end

  def add_full_name
    "#{customer.first_name} #{customer.last_name} "
  end
end
