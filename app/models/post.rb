class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  self.per_page = 20
end
