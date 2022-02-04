class RenameCostomerIdColumnToCartProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :cart_products, :costomer_id, :customer_id
  end
end
