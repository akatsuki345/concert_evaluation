class Concert < ApplicationRecord

  belongs_to :category
  # Concertテーブルに、customer_idを追加して、以下のコメントを外す
  belongs_to :customer
  has_one :cart_item
  has_many :order_details
  has_many :revues, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  enum status: { public: 0, private: 1 }, _prefix: true

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
    # @concert = Concert.where(word.map { |term| "name LIKE '%#{term}%'" }.join(' OR '))
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

  def save_tags(tags)
    tag_list = tags.split(",")
    current_tags = self.tags.pluck(:name)
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end
    new_tags.each do |new|
      striped_new = new.gsub(/(^[[:space:]]+)|([[:space:]]+$)/, '')
      new_concert_tag = Tag.find_or_create_by(name: striped_new)
      self.tags << new_concert_tag
    end
  end

end
