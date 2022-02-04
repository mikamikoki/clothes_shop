class AddExplanationToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :explanation, :text
  end
end
