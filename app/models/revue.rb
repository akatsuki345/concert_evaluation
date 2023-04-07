class Revue < ApplicationRecord

  belongs_to :customer
  belongs_to :concert
  has_many :comments, dependent: :destroy

end
