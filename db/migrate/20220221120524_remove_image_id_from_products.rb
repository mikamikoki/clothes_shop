class RemoveImageIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :image_id, :string
  end
end
