class AddItemMoreInfoUrl < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :more_info_url, :string
  end
end
