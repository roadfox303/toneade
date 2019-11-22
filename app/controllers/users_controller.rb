class UsersController < ApplicationController
  before_action :set_id, only: [:show, :phrases]
  before_action :toneade_const, only: [:show, :phrases, :nices]
  def index
    @page_name = "User List"
    gon.page_name = @page_name
    @user = User.all
  end
  def show
    @page_name = "User Profile"
    gon.page_name = @page_name
    @user = User.find(params[:id])
    @blogs_all = Blog.where(user_id: @user.id).order(created_at: :desc)
    @blogs10 = @blogs_all.limit(10)
    @blogs_num = @blogs_all.size
    @nice_total = 0
    @blogs_all.each do |blog|
      @nice_total += blog.nices.size
    end
    @nices = Nice.where(user_id: @user.id).order(created_at: :desc).limit(10)
  end
  def phrases
    @page_name = "User Phrase List"
    @user = User.find(params[:id])
    @blogs = Blog.where(user_id: @user.id).order(created_at: :desc)
  end
  def nices
    @page_name = "Nice List"
    @nices = Nice.where(user_id: current_user.id)
  end
  private
  def set_id
    @user = User.find(params[:id])
  end
end
