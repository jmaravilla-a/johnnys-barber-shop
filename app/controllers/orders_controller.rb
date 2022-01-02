class OrdersController < ApplicationController

    def index
        # check to see if their is an existing order with a paid boolean of false
        order = @current_user.orders.where(paid: false)
        if order.size > 0
            items = order.first.items
            render json: items, status: :ok
        else
            items = []
            render json: items, status: :ok
        end
    end
    
end