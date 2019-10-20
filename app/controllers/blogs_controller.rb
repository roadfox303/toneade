class BlogsController < ApplicationController
  # require '../../toneade.rb'
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_id, only: [:edit, :destroy, :update, :show]
  before_action :toneade_const, only: [:new, :edit, :show]

  def index
    @page_name = "Phrase Index"
    @blogs = Blog.all.reverse
  end

  def new
    @page_name = "New Phrase"
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
    @page_name = "Edit Phrase"
    if user_signed_in?
      gon.current_user_id = current_user.id
    end
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

  def toneade_const
    @scales = SCALE
    # @test = @scales.find{ |item| item[:name] == "N miner scale" }
    # @test2 = @chords.find_all{ |item| item[:notes].include?("9") }
    gon.scales = @scales.to_json
    @notes = NOTE
    gon.notes = @notes.to_json
    @chords = CHORD
    gon.chords = @chords.to_json
  end
end
