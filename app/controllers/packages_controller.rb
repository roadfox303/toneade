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
    require 'json'
    # Using Sinatra
    post '/webhook' do
      payload = request.body.read
      event = nil

      begin
        event = Stripe::Event.construct_from(
          JSON.parse(payload, symbolize_names: true)
        )
      rescue JSON::ParserError => e
        # Invalid payload
        status 400
        return
      end

      # Handle the event
      case event.type
      when 'payment_intent.succeeded'
        payment_intent = event.data.object # contains a Stripe::PaymentIntent
        # Then define and call a method to handle the successful payment intent.
        # handle_payment_intent_succeeded(payment_intent)
      when 'payment_method.attached'
        payment_method = event.data.object # contains a Stripe::PaymentMethod
        # Then define and call a method to handle the successful attachment of a PaymentMethod.
        # handle_payment_method_attached(payment_method)
      # ... handle other event types
      else
        # Unexpected event type
        status 400
        return
      end

      status 200
    end
  end

  def destroy
  end

end
