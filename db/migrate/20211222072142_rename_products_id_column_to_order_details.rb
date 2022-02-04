class RenameProductsIdColumnToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_details, :products_id, :product_id
  end
end
