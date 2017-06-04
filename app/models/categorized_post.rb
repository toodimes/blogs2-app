class CategorizedPost < ApplicationRecord
  belongs_to :post
  belongs_to :category

  validates :category_id, :post_id, presence: true
end
