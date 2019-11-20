class UsersController < ApplicationController
  before_action :set_id, only: [:show, :phrases]
  before_action :toneade_const, only: [:show, :phrases]
  def index
    @page_name = "User List"
    gon.page_name = @page_name
    @user = User.all
  end
  def show
    @page_name = "User Profile"
    gon.page_name = @page_name
    @user = User.find(params[:id])
    @blogs10 = Blog.where(user_id: current_user.id).order(created_at: :desc).limit(10)
    @blogs_num = Blog.where(user_id: current_user.id).size
  end
  def phrases
    @page_name = "User Phrase List"
  end
  private
  def set_id
    @user = User.find(params[:id])
  end
end
