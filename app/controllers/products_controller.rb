class ProductsController < ApplicationController
  def index
    @products = Product.all

    @cart = Cart.new session
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    cart.add_product params[:id], params[:size]

    render nothing: true
  end

  def decrease_from_cart
    cart.decrease_product params[:id], params[:size]

    redirect_to new_order_path
  end

  def remove_from_cart
    cart.remove_product params[:id], params[:size]

    redirect_to new_order_path
  end

  private

  def cart
    Cart.new session
  end
end
