class CreateAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.string :image
      t.integer :user_id

      t.timestamps
    end
    add_column :users, :likes, :integer, default: 1
  end
end
