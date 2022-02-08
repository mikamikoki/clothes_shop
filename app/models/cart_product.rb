class CartProduct < ApplicationRecord

 belongs_to :product
 belongs_to :customer

 validates :amount, presence: true
 validates :product_id, presence: true

end
