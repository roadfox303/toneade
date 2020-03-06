class PackagesController < ApplicationController
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
    
#   @amount = 500
#   customer = Stripe::Customer.create(
#     :email => params[:stripeEmail],
#     :source  => params[:stripeToken]
#   )
#
#   charge = Stripe::Charge.create(
#     :customer    => customer.id,
#     :amount      => @amount,
#     :description => 'Rails Stripe customer',
#     :currency    => 'usd'
#   )
#
# rescue Stripe::CardError => e
#   flash[:error] = e.message
#   redirect_to new_charge_path
  end
end
