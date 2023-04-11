class Category < ApplicationRecord
  has_many :customers, dependent: :destroy
  has_many :concerts
  validates :name, presence:true
end
