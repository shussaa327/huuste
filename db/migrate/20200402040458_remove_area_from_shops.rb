class RemoveAreaFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :area, :string
    add_column :shops, :area_id, :integer
  end
end
