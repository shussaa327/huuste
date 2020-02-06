class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :order_postal_code
      t.string :area
      t.string :phone_number
      t.string :open_time
      t.integer :average_price

      t.timestamps
    end
  end
end
