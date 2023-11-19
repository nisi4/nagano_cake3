class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.page(params[:page]).per(8)
    @item_count = Item.count
  end

  def show
  end
end
