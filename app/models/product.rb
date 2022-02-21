class Product < ApplicationRecord

  belongs_to :genre
  has_many :cart_products
  has_many :orders, through: :order_details
  has_many :order_details
  has_many :product_images, dependent: :destroy
  accepts_attachments_for :product_images, attachment: :image, append: true

  # validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :genre_id, presence: true
  # 値段設定時、半角数字のみ登録可能にするバリデーション
  validates :price, presence: true, format: {
    with: /\A[0-9]+\z/i,
  }

end
