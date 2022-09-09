class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index user_posts]

  def index
    @posts = Post.all.includes(:user).paginate(page: params[:page]).order('id DESC')
  end

  def user_posts
    @posts = Post.where(user: user_id_params).includes(:user).paginate(page: params[:page]).order('id DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user: current_user, content: post_params)

    if @post.save
      posts = Post.all.includes(:user).paginate(page: 1).order('id DESC')
      respond_to do |format|
        format.html { redirect_to root_path, posts: }
      end
    else
      respond_to do |format|
        format.turbo_stream { render :form_update, locals: { flash: } }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)[:content]
  end

  def user_id_params
    params.require(:user_id)
  end
end
