class RenameImageColumnToProducts < ActiveRecord::Migration[5.2]
  def change
     rename_column :products, :image, :image_id
  end
end
