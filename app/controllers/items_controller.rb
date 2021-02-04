class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end
end
