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

  def username = user.username
end
