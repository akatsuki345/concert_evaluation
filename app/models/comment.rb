class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :revue
  belongs_to :admin

end
