class CreateUserFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :user_favorites do |t|
      t.integer :user_id
      t.integer :post_id
      t.boolean :deleted_at

      t.timestamps
    end
  end
end
