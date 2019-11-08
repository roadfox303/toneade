class BlogsController < ApplicationController
  # require '../../toneade.rb'
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_id, only: [:edit, :destroy, :update, :show]
  before_action :toneade_const

  def index
    @page_name = "Phrase Index"
    @blogs = Blog.all.reverse
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
      phrase_attributes: [:id, :key, :scale, :bpm, :master_data, :user_id, :_destroy,
            [tracks_attributes: [:id, :name, :tr_type, :instrument, :data, :_destroy]]
      ]
    )
  end
  # def blog_params
  #   binding.pry
  #   params.require(:blog).permit(
  #     :id,
  #     :title,
  #     :content,
  #     phrase_attributes: [:id, :key, :scale, :bpm, :master_data, :_destroy,
  #       [tracks_attributes: [:id, :name, :type, :instrument, :data, :phrase_id, :_destroy]]
  #     ]
  #   )
  # end
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
    gon.scales = SCALE

    @keys = KEY
    @keys_list = generate_form_select(KEY,:name)
    gon.keys = KEY

    @bpm_list = []
    [*20..240].map{ |bpm|
      @bpm_list << ["♩#{bpm}",bpm]
    }

    @beats = BEAT
    gon.beats = BEAT
    @beats_list = generate_form_select(BEAT,:name)

    @notes = NOTE
    gon.notes = NOTE

    @chords = CHORD
    gon.chords = CHORD
    # @test = @scales.find{ |item| item[:name] == "N miner scale" }
    # @test2 = @chords.find_all{ |item| item[:notes].include?("9") }
    @tr_types = TR_TYPE
    @tr_type_list = generate_form_select(TR_TYPE,:name)
    gon.tr_types = @tr_type_list

    # @dv_types = DV_TYPE
    # @dv_type_list = generate_form_select(DV_TYPE,:name)
    # gon.dv_types = @dv_type_list
    @instrument_categorys = CATEGORY
    @inst_category_list = generate_form_select(CATEGORY,:name)
    gon.inst_categorys = @inst_category_list

    @instrument_categorys = CATEGORY
    @inst_category_list = generate_form_select(CATEGORY,:name)
    gon.inst_categorys = @inst_category_list

    @presets = PRESET
    @preset_list = generate_form_select(PRESET,:name)
    gon.presets = @preset_list

  end
  def generate_form_select(hash,key)
    hash.map {|item| [item[key],(item[:id])] }
  end
end
