class Product < ApplicationRecord

  belongs_to :genre
  has_many :cart_products
  has_many :orders, through: :order_details
  has_many :order_details

  attachment :image

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :genre_id, presence: true
  # 値段設定時、半角数字のみ登録可能にするバリデーション
  validates :price, presence: true, format: {
    with: /\A[0-9]+\z/i,
  }

end
