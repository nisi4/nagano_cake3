class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.where(customer_id: @customer.id)
  end
  
  def confirm
    if params[:order][:select_address] == "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:select_address] == "1"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else 
      @order = Order.new(order_params)
    end
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = 0
    @order.customer_id = current_customer.id
  end
  
  def create
    @order = Order.new(order_params)
    @order.postage
    @order.customer_id = current_customer.id
    @order.save
    order_item = OrderItem.new(order_item_params)
    
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.each do |cart_item|
      order_item.order_id = @order.id
      order_item.item_id = cart_item.item_id
      order_item.price = cart_item.item.tax_included_price
      order_item.amount = cart_item.amount
    end
    current_customer.cart_items.destroy_all
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
    params.require(:order).permit(:postal_code,:address,:name,:payment_method,:payment)
  end
  
  def order_item_params
    params.require(:order_item).permit(:item_id,:price,:amount)
  end
end
