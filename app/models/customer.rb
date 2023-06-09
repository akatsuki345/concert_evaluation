class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :concerts, dependent: :destroy
  has_many :revues, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :category
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :nickname, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :email, presence: true

  def add_full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.guest
    find_or_create_by!(
      first_name: '太郎' ,
      last_name: 'guest' ,
      first_name_kana: 'タロウ' ,
      nickname: 'ゲストタロウ' ,
      last_name_kana: 'ゲスト' ,
      postal_code: '0000000000' ,
      address: '東京都' ,
      telephone_number: '0000000000' ,
      email: 'guest@example.com' ,
      category_id: "1"
    ) do |customer|
      customer.password = SecureRandom.urlsafe_base64
    end
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @customer = Customer.where("first_name LIKE?", "#{word}")
    elsif search == "forward_match"
      @customer = Customer.where("first_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @customer = Customer.where("first_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @customer = Customer.where("first_name LIKE?","%#{word}%")
    else
      @customer = Customer.all
    end
  end

end