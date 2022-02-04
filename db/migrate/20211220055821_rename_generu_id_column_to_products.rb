class RenameGeneruIdColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :generu_id, :genre_id
  end
end
