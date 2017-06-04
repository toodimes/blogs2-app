class CreatePostImages < ActiveRecord::Migration[5.0]
  def change
    create_table :site_images do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
