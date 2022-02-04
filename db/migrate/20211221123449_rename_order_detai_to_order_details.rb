class RenameOrderDetaiToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    rename_table :order_detais, :order_details
  end
end
