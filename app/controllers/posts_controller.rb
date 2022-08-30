class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]

  def index
    @posts = Post.all.includes(:user).paginate(page: params[:page]).order('id DESC')
  end

  def new() end
end
