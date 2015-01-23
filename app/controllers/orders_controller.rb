class OrdersController < ApplicationController
  def new
    @cart = Cart.new session
  end
end
