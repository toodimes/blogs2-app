class Post < ApplicationRecord
  belongs_to :user
  has_many :post_images
  has_many :categorized_posts
  has_many :categories, through: :categorized_posts

  validates :title, :content, :user_id, :presence => true

  def increase_views
    self.views = views + 1
  end

  def increase_likes
    self.likes = likes + 1
  end
end
