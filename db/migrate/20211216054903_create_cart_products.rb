class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.timestamps
      t.integer :costomer_id, null: false
      t.integer :product_id, null: false
      t.integer :amount, null: false

    end
  end
end
