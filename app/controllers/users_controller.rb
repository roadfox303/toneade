class UsersController < ApplicationController
  def index
    @page_name = "User List"
    @user = User.all
  end
  def show
    @page_name = "User Profile"
    @user = User.find(params[:id])
  end
end
