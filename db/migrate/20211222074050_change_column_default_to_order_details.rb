class ChangeColumnDefaultToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    change_column_default :order_details, :created_status, from: nil, to: "0",null: false
  end
end
