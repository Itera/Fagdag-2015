class ProductsController < ApplicationController
  def index
    @cart = Cart.new session
  end

  def add_to_cart
    cart.add_product params[:id], params[:size]

    redirect_to :root
  end

  def decrease_from_cart
    cart.decrease_product params[:id], params[:size]

    redirect_to :root
  end

  def remove_from_cart
    cart.remove_product params[:id], params[:size]

    redirect_to :root
  end

  private

  def cart
    Cart.new session
  end
end
