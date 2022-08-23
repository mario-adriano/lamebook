class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  
  def index
  end

  def new
  end
end
