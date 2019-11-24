class BlogsController < ApplicationController
  # require '../../toneade.rb'
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_id, only: [:edit, :destroy, :update, :show]
  before_action :toneade_const

  def index
    @page_name = "Phrase Index"
    gon.page_name = @page_name
    @blogs = Blog.all.order(created_at: :desc)
  end

  def new
    @page_name = "New Phrase"
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
      flash[:notice] = "ブログを作成しました"
      redirect_to blogs_path
    else
      flash[:notice] = "ブログの作成に失敗しました"
      render :new
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
    unless @blog.phrase.tracks[0]['data'].empty?
      @track = @blog.phrase.tracks[0]
      gon.blog_key = @blog.phrase.key
      gon.blog_scale = @blog.phrase.scale
      gon.blog_progression = @blog.phrase.tracks[0]['data']
      gon.blog_sequense = @blog.phrase.tracks
    else
      gon.blog_sequense = false
      @track = false
    end

    @page_name = "Edit Phrase"
    gon.page_name = @page_name
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

  def show
    @page_name = "Phrase"
    gon.page_name = @page_name
    @blog = Blog.find(params[:id])
    @user = User.find(@blog.user_id)
    unless @blog.phrase.tracks[0]['data'].empty?
      @track = @blog.phrase.tracks[0]
      gon.blog_key = @blog.phrase.key
      gon.blog_scale = @blog.phrase.scale
      gon.blog_progression = @blog.phrase.tracks[0]['data']
      gon.blog_sequense = @blog.phrase.tracks
    else
      gon.blog_sequense = false
      @track = false
    end
    if user_signed_in?
      @nice = current_user.nices.find_by(blog_id: @blog.id)
    end
    @nice_number =  @blog.nices.all.size
    @blog_comments = @blog.comments
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
            [tracks_attributes: [:id, :name, :tr_type, :instrument, :data, :_destroy]]
      ]
    )
  end


  def set_id
    @blog = Blog.find(params[:id])
  end

end
