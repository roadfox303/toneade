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
    @phrase = @blog.build_phrase
    @track = @phrase.tracks.build

    @bpm_selected = "♩120"
    @beat_selected = "4/4"
    @key_selected = "C"
    @key_selected = "Major"
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
  # def blog_params
  #   params.require(:blog).permit(:id, :title, :content)
  # end
  def blog_params
    params.require(:blog).permit(
      :id,
      :title,
      :content,
      phrase_attributes: [:id, :key, :scale, :bpm, :master_data, :_destroy,
        [tracks_attributes: [:id, :name, :type, :instrument, :data, :phrase_id, :_destroy]]
      ]
    )
  end
  # def project_params
  #   params.require(:project).permit(:name, :description, tasks_attributes: [:id, :description, :done, :_destroy,
  #                                                        items_attributes: [:id, :description, :_destroy]])
  #   end
  # def order_params
  # 　params.require(:order).permit(:date,
  # 　　　　　　　　　　　　　　:time,
  # 　　　　　　　　　　　　　　:receiving_method,
  # 　　　　　　　　　　　　　　:receiving_store,
  # 　　　　　　　　　　　　　　:delivery_address,
  # 　　　　　　　　　　　　　　:payment,
  # 　　　　　　　　　　　　　　:voucher,
  # 　　　　　　　　　　　　　　:message,
  # 　　　　　　　　　　　　　　[ordered_products_attributes: [:order_id, :product_id, :count]]
  # 　　　　　　　　　　　　　　).merge(user_id: current_user.id)
  # end

  def set_id
    @blog = Blog.find(params[:id])
  end

  def toneade_const
    @scales = SCALE
    @scales_list = generate_form_select(SCALE,:name)
    gon.scales = @scales.to_json

    @keys = KEY
    @keys_list = generate_form_select(KEY,:name)

    @bpm_list = [*"♩1".."♩300"]

    @beats = BEAT
    @beats_list = generate_form_select(BEAT,:name)

    @notes = NOTE
    gon.notes = @notes.to_json

    @chords = CHORD
    gon.chords = @chords.to_json
    # @test = @scales.find{ |item| item[:name] == "N miner scale" }
    # @test2 = @chords.find_all{ |item| item[:notes].include?("9") }
  end
  def generate_form_select(hash,key)
    hash.map {|item| [item[key],(item[:id] - 1)] }
  end
end
