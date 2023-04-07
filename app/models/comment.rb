class Comment < ApplicationRecord

  belongs_to :revue
  belongs_to :admin
  belongs_to :customer

end
