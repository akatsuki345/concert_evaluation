class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :concert
  belongs_to :revue

end
