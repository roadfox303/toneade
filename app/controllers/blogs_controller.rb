class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_id, only: [:edit,  :destroy, :update, :show]
  def index
    @blogs = Blog.all.reverse
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:notice] = "ブログを作成しました"
      redirect_to blogs_path
    else
      flash[:notice] = "ブログの作成に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    @blog.update(blog_params)
    if @blog.save
      flash[:notice] = "ブログを編集しました"
      redirect_to blogs_path
    else
      flash[:notice] = "ブログ編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @blog.destroy
    flash[:notice] = "ブログを削除しました"
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:id, :title, :content)
  end

  def set_id
    @blog = Blog.find(params[:id])
  end
end
