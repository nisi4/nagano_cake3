class Admin::ItemsController < ApplicationController
  def new
  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end
end
