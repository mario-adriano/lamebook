# frozen_string_literal: true

# rubocop:disable Style/Documentation
class PostDto
  attr_reader :id, :content, :likes_count, :liked, :user, :username

  def initialize(post)
    @id = post[:id]
    @content = ActionText::Content.new(post[:content]).to_rendered_html_with_layout
    @likes_count = post[:likes_count]
    @liked = post[:liked]
    @user = User.new(id: post[:user_id])
    @username = post[:username]
  end

  def liked?
    liked
  end
end
