class CartsController < ApplicationController
  def show
    @cart = cart

    render "_show", layout: false
  end

  def add_to
    cart.add_product params[:id], params[:size]

    render nothing: true
  end

  def decrease_from
    cart.decrease_product params[:id], params[:size]

    redirect_to new_order_path
  end

  def remove_from
    cart.remove_product params[:id], params[:size]

    redirect_to new_order_path
  end

  private

  def cart
    Cart.new session
  end
end
