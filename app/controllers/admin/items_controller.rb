class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_show_path
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
