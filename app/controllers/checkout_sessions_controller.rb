class CheckoutSessionsController < ApplicationController

    # YOUR_DOMAIN = 'http://localhost:4242'
    Stripe.api_key = ENV["SECRET_API_KEY"]
    
    def create
        price_ids = params["price_id"]
        price_ids_array = price_ids.map{|price_id| {price: price_id, quantity: 1}}
        
        stripe_session = Stripe::Checkout::Session.create({
            line_items: price_ids_array,
            mode: 'payment',
              success_url: 'http://localhost:3001/',
              cancel_url: 'http://localhost:3001/'
              })
                # redirect_to stripe_session.url
                url = stripe_session.url
            #   byebug

        render json: url, status: :ok
              
    end


end
