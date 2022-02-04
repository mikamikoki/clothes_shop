class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
 has_many :addresses, dependent: :destroy
 has_many :orders
 has_many :cart_products, dependent: :destroy

  validates :first_name, :last_name, :first_name_kana, :last_name_kana,
            :address, :phone_number,
            presence: true
  validates :post_code, length: {is: 7}, numericality: { only_integer: true }
  validates :phone_number, numericality: { only_integer: true }
  validates :first_name_kana, :last_name_kana,
     format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "をカタカナで入力して下さい。"}

# 退会機能
  def active_for_authentication?
    super && (self.withdrawal_status == false)
  end

end
