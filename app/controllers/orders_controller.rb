class OrdersController < ApplicationController
  def new
    @cart = Cart.new session
    @order = Order.new
  end

  def index
    @orders = Order.all
  end
  def create
    @order = Order.new(order_params)
    @order.user = User.all[0]
    @order.save
    cart = Cart.new session
    cart.products.each do |prod, size, amount|
      ol = OrderLine.new(order: @order, product: prod, size: size, count:amount)
      ol.save
    end
    redirect_to(orders_path)
  end
  def order_params
    params.permit(:credit_card, :exp_month, :exp_year, :cc)
  end
end
