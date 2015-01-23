class OrdersController < ApplicationController
  def new
    @cart = Cart.new session
  end

  def index
    @orders = Order.all
  end
end
