# frozen_string_literal: true

class BlogsController < ApplicationController
  # require '../../toneade.rb'
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_id, only: %i[edit destroy update show]
  before_action :toneade_const

  def top
    @page_name = 'Chord Sequencer'
    gon.page_name = @page_name
  end

  def manual
    @page_name = 'UI Manual'
    gon.page_name = @page_name
  end

  def index
    @page_name = 'All Phrases'
    gon.page_name = @page_name
    # @articles = Blog.all.includes(:user)
    # binding.pry
    # @nices = current_user.nices
    @blogs = Blog.all.includes(:user, :phrase, :nices).page(params[:page]).per(10).order(created_at: :desc)
    # @blogs = Blog.all.order(created_at: :desc)
  end

  def new
    @page_name = 'New Phrase'
    gon.page_name = @page_name
    @blog = Blog.new
    @phrase = @blog.build_phrase
    @track = @phrase.tracks.build
    gon.tracks = @track
    @phrase[:bpm] = 120
    @phrase[:beat] = 1
    @phrase[:key] = 1
    @phrase[:scale] = 1
    @track[:instrument] = []
    @track[:data] = []
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:notice] = 'フレーズを作成しました'
      redirect_to blogs_path
    else
      flash[:notice] = 'フレーズの作成に失敗しました'
      redirect_to blogs_path
    end
  end

  def edit
    @phrase = Phrase.find_by(blog_id: @blog.id)
    gon.phrase = @phrase
    @bpm_selected = @phrase[:bpm]
    @beat_selected = @phrase[:beat]
    @key_selected = @phrase[:key]
    @scale_selected = @phrase[:scale]
    @tracks = @phrase.tracks.all
    gon.tracks = @tracks
    if @blog.phrase.tracks[0]['data'].empty?
      gon.blog_sequense = false
      @track = false
    else
      @track = @blog.phrase.tracks[0]
      gon.blog_key = @blog.phrase.key
      gon.blog_scale = @blog.phrase.scale
      gon.blog_progression = @blog.phrase.tracks[0]['data']
      gon.blog_sequense = @blog.phrase.tracks
    end

    @page_name = 'Edit Phrase'
    gon.page_name = @page_name
    gon.current_user_id = current_user.id if user_signed_in?
  end

  def update
    @blog.update(blog_params)
    if @blog.save
      flash[:notice] = 'フレーズを編集しました'
      redirect_to blogs_path
    else
      flash[:notice] = 'フレーズ編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @blog.destroy
    flash[:notice] = 'フレーズを削除しました'
    redirect_to blogs_path
  end

  def show
    @page_name = 'Phrase'
    gon.page_name = @page_name
    @blog = Blog.find(params[:id])
    @user = User.find(@blog.user_id)
    if @blog.phrase.tracks[0]['data'].empty?
      gon.blog_sequense = false
      @track = false
    else
      @track = @blog.phrase.tracks[0]
      gon.blog_key = @blog.phrase.key
      gon.blog_scale = @blog.phrase.scale
      gon.blog_bpm = @blog.phrase.bpm
      gon.blog_progression = @blog.phrase.tracks[0]['data']
      gon.blog_sequense = @blog.phrase.tracks
    end
    @nice = current_user.nices.find_by(blog_id: @blog.id) if user_signed_in?
    @nice_number = @blog.nices.all.size
    @blog_comments = @blog.comments
    gon.blog_comments = @blog_comments
  end

  private

  # def blog_params
  #   params.require(:blog).permit(:id, :title, :content)
  # end
  def blog_params
    params.require(:blog).permit(
      :id,
      :title,
      :content,
      :user_id,
      phrase_attributes: [:id, :key, :scale, :bpm, :beat, :master_data, :user_id, :_destroy,
                          [tracks_attributes: %i[id name tr_type instrument data _destroy]]]
    )
  end

  def set_id
    @blog = Blog.find(params[:id])
  end
end
