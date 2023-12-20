class CreatePostPhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :post_photos do |t|
      t.integer :user_id, null: false
      t.string :model_name, null: false
      t.text :introduction, null: false
      t.timestamps
    end
  end
end
