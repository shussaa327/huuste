class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :comment
      t.integer :rating
      t.integer :post_user_id
      t.integer :post_shop_id
      t.integer :post_image_id

      t.timestamps
    end
  end
end
