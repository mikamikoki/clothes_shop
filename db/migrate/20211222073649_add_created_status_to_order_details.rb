class AddCreatedStatusToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :created_status, :integer
  end
end
