class OrderItemsController < ApplicationController

    def create 
        byebug
        # Check to see if an order exists with the paid boolean being false
        order = @current_user.orders.where(paid: false)
        # If unpaid order exists, create an instance of order_items for the item sent 
        if order
            @new_item = OrderItem.new(item_params)
            @new_item.order_id = order.first.id
            @new_item.save
            render json: {message: "Added to cart!"}, status: :created
        else
            new_order = Order.create(date: DateTime.now.to_date, user_id: @current_user.id)
            new_item = OrderItem.new(item_params)
            new_item.order_id = new_order.id
            new_item.save
            render json: new_item, status: :created
        end
    end

    def destroy
        order = @current_user.orders.where(paid: false)
        order_item = order.first.order_items.find_by!(item_id: params[:id])
        order_item.destroy
        render json: {}, status: :ok
    end

    private

    def item_params
        params.permit(:item_id, :item_name)
    end

end
