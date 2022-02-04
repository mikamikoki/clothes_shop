class RemoveExplanationFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :explanation, :string
  end
end
