# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  content           :text
#  likes             :like
#  user_id           :integer          not null
#
class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  has_rich_text :content

  self.per_page = 20

  validates :content, presence: true

  def username = user.username

  class << self
    def all_left_joins_likes(current_user)
      joins(:user)
        .joins('LEFT JOIN action_text_rich_texts ON action_text_rich_texts.record_id = posts.id')
        .joins("LEFT JOIN likes ON likes.post_id = posts.id AND likes.user_id = #{current_user.try(:id) || 'null'}")
        .select("posts.id,
                 action_text_rich_texts.body AS content,
                 posts.user_id,
                 users.username,
                 (SELECT COUNT(id) FROM likes WHERE post_id = posts.id) AS likes_count,
                 COUNT(likes) > 0 AS liked")
        .group('posts.id, users.username, action_text_rich_texts.body')
    end
  end
end
