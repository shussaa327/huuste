class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address, unique: true
      t.string :order_postal_code
      t.string :area
      t.string :phone_number
      t.string :open_time
      t.string :close_time
      t.integer :min_average_price
      t.integer :max_average_price

      t.timestamps
    end
  end
end
