class AddViewsAndLikesToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :views, :integer, default: 1
    add_column :posts, :likes, :integer, default: 1
  end
end
