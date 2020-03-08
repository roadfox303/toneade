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

end
