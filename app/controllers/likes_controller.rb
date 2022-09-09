class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find_by_id(like_params['post_id'])
    @like = Like.new(user: current_user, post:)

    like_turbo_frame(post) if @like.save
  end

  def destroy
    post = Post.find_by_id(id_params)

    if @like = Like.find_by(user: current_user, post:)

      @like.delete

      like_turbo_frame(post)
    end
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
      if turbo_frame_request? && turbo_frame_request_id == "like-dislike-#{post.id}"
        format.html { render partial: 'like', locals: { post:, like_count: Like.size_likes_post(post) } }
      else
        format.html
      end
    end
  end
end
