class Revue < ApplicationRecord

  belongs_to :customer
  belongs_to :concert
  belongs_to :admin
  has_many :comments, dependent: :destroy

end
