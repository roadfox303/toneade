# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_id, only: %i[show phrases edit]
  before_action :toneade_const, only: %i[show phrases nices]

  def index
    @page_name = 'User List'
    gon.page_name = @page_name
    @users = User.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
    @page_name = 'User Profile'
    gon.page_name = @page_name
    @user = User.find(params[:id])
    @blogs_all = Blog.where(user_id: @user.id).order(created_at: :desc)
    @blogs_num = @blogs_all.size
    # @nice_total = 0
    # @blogs_all.each do |blog|
    #   @nice_total += blog.nices.size
    # end
    @nices = @user.nice_blogs.order(created_at: :desc)
  end

  def phrases
    @page_name = 'User Phrase List'
    @user = User.find(params[:id])
    @blogs = Blog.where(user_id: @user.id).page(params[:page]).per(10).order(created_at: :desc)
  end

  def nices
    @page_name = 'Nice List'
    @user = User.find(params[:id])
    # @nices = Nice.where(user_id: current_user.id).page(params[:page]).per(10).order(created_at: :desc)
    @nices = @user.nice_blogs.page(params[:page]).per(10).order(created_at: :desc)
  end

  def follow
    @page_name = 'Follow List'
    @follows = current_user.following
  end

  def follower
    @page_name = 'Follower List'
    @followers = current_user.followers
  end

  def edit
    @page_name = 'User Profilessss'
  end

  private

  def set_id
    @user = User.find(params[:id])
  end
end
