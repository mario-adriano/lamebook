class LikesController < ApplicationController
  def create
    post = Post.find_by_id(like_params['post_id'])
    @like = Like.new(user: current_user, post: post)

    unless @like.save
      flash[:notice] = @like.errors.full_messages.to_sentence
    end
    
    respond_to do |format|
      if turbo_frame_request? && turbo_frame_request_id == "like-dislike-#{post.id}"
        format.html { render partial: 'like', locals: { post: post, like_count: Like.size_likes_post(post) } }
      else
        format.html
      end
    end
  end

  def destroy
    post = Post.find_by_id(id_params)
    if @like = Like.find_by(user: current_user, post: post)
      @like.delete
    
      respond_to do |format|
        if turbo_frame_request? && turbo_frame_request_id == "like-dislike-#{post.id}"
          format.html { render partial: 'like', locals: { post: post, like_count: Like.size_likes_post(post) } }
        else
          format.html
        end
      end
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end

  def id_params
    params.require(:id)
  end
end
