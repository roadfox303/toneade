class PackagesController < ApplicationController
  protect_from_forgery with: :null_session
  # protect_from_forgery :except => [:webhook]
  def index
    @page_name = 'Optional Packages'
    gon.page_name = @page_name
    gon.user_id = current_user.id
    @items = Stripe::SKU.list().data
  end

  def create

  end

  def destroy
  end

  def webhook
    case params[:type]
    when 'checkout.session.completed' then
      binding.pry
      package = Package.find_by(product_id: stripe_checkout_params[:product])
      ownd = Ownd.find_or_create_by(user_id: stripe_checkout_user, package_id: package.id)
      ownd.save
      binding.pry
      # redirect_to blog_path(params[:blog_id]), notice: 'Nice!しました'
      # redirect_to users_path(stripe_checkout_params)

    when 'product.updated' then
      find_product(stripe_product_params[:id]).update(name: stripe_product_params[:name], category: stripe_product_params[:metadata][:category])
    when 'product.deleted' then
      find_product(stripe_product_params[:id]).destroy
    when 'sku.created' then
      name = Stripe::Product.retrieve(stripe_sku_params[:product]).name
      package = Package.find_or_create_by(product_id: stripe_sku_params[:product], name: name)
      package.image = stripe_sku_params[:image]
      package.save
    when 'sku.updated' then
      find_sku.update(image: stripe_sku_params[:image])
    else
      redirect_to blogs_path
    end
  end

  private

  def package_save(target,event)
    if target.save
      flash[:notice] = 'フレーズを作成しました'
    else
      flash[:notice] = 'フレーズの作成に失敗しました'
    end
  end

  def find_product(p_id)
    Package.find_by(product_id: p_id)
  end

  def find_sku
    Package.find_by(product_id: stripe_sku_params[:product])
  end

  def stripe_product_params
    params.require(:data).require(:object).permit(:id,:name,metadata:[:category])
  end

  def stripe_sku_params
    params.require(:data).require(:object).permit(:id, :image, :product)
  end

  def stripe_checkout_params
    params.require(:data).require(:object).require(:display_items)[0].require(:sku).permit(:id, :product, :client_reference_id, :image, attributes:[:name])
  end

  def stripe_checkout_user
    params.require(:data).require(:object)[:client_reference_id].split('_')[1]
  end

end
