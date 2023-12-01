class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to public_orders_complete_path
  end

  def complete
    
  end

  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:postal_code,:address,:name,:payment_method)
  end
end
