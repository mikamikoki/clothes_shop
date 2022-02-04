class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.string :post_code,       null: false
      t.string :address,         null: false
      t.string :name,            null: false
      t.integer :shipping_cost,  null: false
      t.integer :billing_amount, null: false
      t.timestamps null: false
    end
  end
end