class ProductsController < ApplicationController
  def index
    @products = Product.all

    @cart = Cart.new session
  end

  def show
    @product = Product.find(params[:id])
  end
end
