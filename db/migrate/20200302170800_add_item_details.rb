class AddItemDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :name, :string
    add_column :items, :price, :float
    add_column :items, :description, :string
  end
end
