class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :comment
      t.string :image_id
      t.integer :rating
      t.integer :user_id
      t.integer :shop_id
      t.integer :image_id

      t.timestamps
    end
  end
end
