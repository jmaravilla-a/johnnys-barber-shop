class CheckoutSessionsController < ApplicationController

    # YOUR_DOMAIN = 'http://localhost:4242'
    Stripe.api_key = ENV["SECRET_API_KEY"]
    
    def create
        price_ids = price_id_params[:price_id]
        if price_ids.length > 0
            
            price_ids_array = price_ids.map{|price_id| {price: price_id, quantity: 1}}
            
            stripe_session = Stripe::Checkout::Session.create({
                line_items: price_ids_array,
                mode: 'payment',
                success_url: 'http://localhost:3001/',
                cancel_url: 'http://localhost:3001/'
                });


            url = [stripe_session.url]

            @current_user.orders.where(paid: false).update(paid: true)
            
            render json: url, status: :ok

        else
            render json: {message: "Please add items to your cart"}
        end
        
              
    end

    private

    def price_id_params
        params.permit(:price_id => [])
    end

end
