class CreateCategorizedPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :categorized_posts do |t|
      t.integer :category_id
      t.integer :post_id

      t.timestamps
    end
  end
end
