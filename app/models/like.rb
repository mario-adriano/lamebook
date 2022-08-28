class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, uniqueness: { scope: :post_id }

  scope :size_likes_post, ->(post) { where(post: post).size }
end
