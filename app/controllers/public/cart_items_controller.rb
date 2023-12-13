class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = 0
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item_add = CartItem.find_by(customer_id: @cart_item.customer_id, item_id: @cart_item.item_id)
      @cart_item_add.amount += @cart_item.amount 
      @cart_item_add.save
    else
      @cart_item.save
    end
    redirect_to public_cart_items_index_path
  end
  
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to public_cart_items_index_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_index_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_index_path
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end
end
