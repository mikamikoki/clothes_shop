class CreateOrderDetais < ActiveRecord::Migration[5.2]
  def change
    create_table :order_detais do |t|
      t.integer :products_id,     null: false
      t.integer :order_id,        null: false
      t.integer :price,           null: false
      t.integer :order_quantity,  null: false

      t.timestamps
    end
  end
end
