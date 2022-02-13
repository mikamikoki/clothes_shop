class AddCashOnDeliveryToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :cash_on_delivery, :integer
  end
end
