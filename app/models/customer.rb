class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :revues, dependent: :destroy
  has_many :concerts, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :category


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
