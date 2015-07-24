class ProductsController < ApplicationController
  def buy
    @product = Product.find(params[:id])
  end
end
