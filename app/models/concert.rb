class Concert < ApplicationRecord

  belongs_to :category
  has_one :cart_item
  has_many :order_details
  has_many :revues, dependent: :destroy
  has_many :comments, dependent: :destroy

  scope :search_category, ->(category) {where(category_id: category)}

  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :is_active, inclusion: [true, false]

  has_one_attached :image

 def get_image
    (image.attached?) ? image : 'no_image.jpg'
 end

 def add_tax_price
   (price*1.1).floor
 end

  def self.looks(search, word)
    if search == "perfect_match"
      @concert = Concert.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @concert = Concert.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @concert = Concert.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @concert = Concert.where("name LIKE?","%#{word}%")
    else
      @concert = Concert.all
    end
  end

end
