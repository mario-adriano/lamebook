# frozen_string_literal: true

# rubocop:disable Style/Documentation
class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find_by_id(like_params['post_id'])
    @like = Like.new(user: current_user, post:)

    like_turbo_frame(post) if @like.save
  end

  def destroy
    post = Post.find_by_id(id_params)

    @like = Like.find_by(user: current_user, post:)

    return unless @like

    @like.delete

    like_turbo_frame(post)
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end

  def id_params
    params.require(:id)
  end

  def like_turbo_frame(post)
    respond_to do |format|
      return format.html unless turbo_frame_request? && turbo_frame_request_id == "like-dislike-#{post.id}"

      format.html do
        render partial: 'like',
               locals: { post:,
                         like_count: Like.size_likes_post(post),
                         liked: Like.exists?(user_id: current_user.id, post_id: post.id) }
      end
    end
  end
end
