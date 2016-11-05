class OrdersController < ApplicationController
  def new
    @cart = Cart.new session
    @order = Order.new
    @users = User.all
  end

  def index
    @orders = Order.all
  end
  def create
    @order = Order.new(order_params)
    @order.save
    cart = Cart.new session
    cart.products.each do |prod, size, amount|
      ol = OrderLine.new(order: @order, product: prod, size: size, count:amount)
      ol.save
    end
    cart.clear
    redirect_to(orders_path)
  end
  def order_params
    params.require(:order).permit(:credit_card, :exp_month, :exp_year, :cc, :user_id)
  end
end
