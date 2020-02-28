class CreateShopRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_recommendations do |t|
      t.integer :user_id
      t.integer :shop_id

      t.timestamps
    end
    add_index :shop_recommendations, :user_id, unique: true
  end
end
