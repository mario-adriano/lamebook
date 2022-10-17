# frozen_string_literal: true

require 'will_paginate/array'

# rubocop:disable Style/Documentation
class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index user_posts]

  def index
    @posts = Post.all_left_joins_likes(current_user).order('id DESC').map { |post| PostDto.new(post) }
                 .paginate(per_page: 20, page: params[:page])
  end

  def user_posts
    @posts = Post.all_left_joins_likes(current_user)
                 .where(user: user_id_params).order('id DESC').map { |post| PostDto.new(post) }
                 .paginate(per_page: 20, page: params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user: current_user, content: post_params)

    return respond_to { |format| format.turbo_stream { render :form_update, locals: { flash: } } } unless @post.save

    posts = Post.all.includes(:user).paginate(page: 1).order('id DESC')

    respond_to do |format|
      format.html { redirect_to root_path, posts: }
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
