class CartProduct < ApplicationRecord

 belongs_to :product
 belongs_to :customer

 validates :amount, presence: true

end
