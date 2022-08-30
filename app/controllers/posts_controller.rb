class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]

  def index
    @posts = Post.all.includes(:user).paginate(page: params[:page]).order('id DESC')
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
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)[:content]
  end
end
