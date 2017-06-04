class PostImage < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :url, :post_id, :user_id, :presence => true
end
