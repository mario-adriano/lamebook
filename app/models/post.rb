class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  has_rich_text :content

  self.per_page = 20

  def username = user.username
end
