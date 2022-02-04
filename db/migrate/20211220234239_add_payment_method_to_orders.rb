class AddPaymentMethodToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :payment_method, :integer , default: 0, null: false
  end
end
