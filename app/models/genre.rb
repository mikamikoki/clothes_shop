class Genre < ApplicationRecord

  has_many :products, dependent: :destroy
  accepts_attachments_for :images, attachment: :image, append: true

  validates :name, {presence: true}

end
