class Address < ApplicationRecord

  belongs_to :customer
  validates :postal_code,presence: true, format:/\A\d{7}\z/
  validates :address, presence: true
  validates :name, length: {in: 2..20}

  def join_address_name
    "〒#{self.postal_code} #{self.address} #{self.name}"
  end

end
