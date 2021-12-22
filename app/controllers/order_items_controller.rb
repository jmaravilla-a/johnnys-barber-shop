class OrderItemsController < ApplicationController

    def create 
        # Check to see if an order exists with the paid boolean being false
        unpaidOrder = @current_user.Order.where(paid: false)
        # Create an instance of order_items for each item sent 
        if unpaidOrder
            
            
        # If such order exists, skip creating an order. Else:
        # Create an instance of order
        # Then,
        # Create an instance of order_items for each item sent 
        # 
    end

    private

    def item_params
        
    end
end
