class PackagesController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @page_name = 'Optional Packages'
    gon.page_name = @page_name
    @items = Stripe::SKU.list().data
    # @patchs = Stripe::Product.list().data.find_all { |product|
    #   product.metadata.category == "patch"
    # }
    # @test = []
    # @patchs.each{ |patch|
    #   @test << Stripe::SKU.list(attributes[product]=red)
    # }
    # binding.pry

  end

  def create

  end

  def destroy
  end

  def webhook
    case params[:type]
    when 'checkout.session.completed' then
      値1と一致する場合に行う処理
    when 'product.created' then
      package = Package.new(product_id: stripe_product_params.id, name: stripe_product_params.name)
      package.save
    when 'sku.created' then
      package = Package.find_by(product_id: stripe_sku_params.product)
      package.update(image: stripe_product_params.image)
    when 'product.updated' then
      値3と一致する場合に行う処理
    when 'sku.updated' then
      値3と一致する場合に行う処理
    when 'sku.deleted' then
      値3と一致する場合に行う処理
    else
      redirect_to blogs_path
    end
    binding.pry
  end

  private

  def package_save(target,event)
    if target.save
      flash[:notice] = 'フレーズを作成しました'
    else
      flash[:notice] = 'フレーズの作成に失敗しました'
    end
  end

  def stripe_product_params
    params.require(:data).require(:object).permit(:id,:name,metadata:[:category])
  end

  def stripe_sku_params
    params.require(:data).require(:object).permit(:id, :imagea, :product)
  end

  def stripe_checkout_params
    params.require(:data).require(:object).require(:display_items)[0].require(:sku).permit(:id, :product, :image, attributes:[:name])
  end

end
