class Category < ApplicationRecord
  has_many :customers, dependent: :destroy
end
