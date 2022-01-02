class CheckoutSessionsController < ApplicationController

    # YOUR_DOMAIN = 'http://localhost:4242'
    Stripe.api_key = ENV["SECRET_API_KEY"]
    
    def create

        byebug

        stripe_session = Stripe::Checkout::Session.create({
            line_items: [{
              # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
              price: '{{PRICE_ID}}',
              quantity: 1,
            }],
            mode: 'payment',
              success_url: 'http://localhost:3001/',
              cancel_url: 'http://localhost:3001/',
          })
          redirect stripe_session.url, 303

    end

    # private

    # def item_params
    #     params.permit(:cart, :id, :name, :price, :price_id, :category)
    # end

end
