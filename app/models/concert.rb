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

    # タグをスペース区切りで分割し配列にする
    #   連続した空白も対応するので、最後の“+”がポイント
    tag_list = tags.split(",")

    # 自分自身に関連づいたタグを取得する
    current_tags = self.tags.pluck(:name)

    # (1) 元々自分に紐付いていたタグと投稿されたタグの差分を抽出
    #   -- 記事更新時に削除されたタグ
    old_tags = current_tags - tag_list

    # (2) 投稿されたタグと元々自分に紐付いていたタグの差分を抽出
    #   -- 新規に追加されたタグ
    new_tags = tag_list - current_tags
    p current_tags

    # tag_mapsテーブルから、(1)のタグを削除
    #   tagsテーブルから該当のタグを探し出して削除する
    old_tags.each do |old|
      # tag_mapsテーブルにあるpost_idとtag_idを削除
      #   後続のfind_byでtag_idを検索
      self.tags.delete Tag.find_by(name: old)
    end

    # tagsテーブルから(2)のタグを探して、tag_mapsテーブルにtag_idを追加する
    new_tags.each do |new|
      # 条件のレコードを初めの1件を取得し1件もなければ作成する
      # find_or_create_by : https://railsdoc.com/page/find_or_create_by
      new_concert_tag = Tag.find_or_create_by(name: new)
      # tag_mapsテーブルにpost_idとtag_idを保存
      #   配列追加のようにレコードを渡すことで新規レコード作成が可能
      self.tags << new_concert_tag
    end
  end

end
