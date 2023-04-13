class TagMap < ApplicationRecord
  belongs_to :concert
  belongs_to :tag
  validates :concert_id, presence: true
  validates :tag_id, presence: true
end
