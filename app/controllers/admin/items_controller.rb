class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end
  
  private
  def item_params
    params.require(:item).permit(:item_image,:name,:introduction,:genre_id,:price,:is_active)
  end
end
