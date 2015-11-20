class ProductsController < ApplicationController
  def index
    @products = Product.order(created_at: :desc).page(params[:page])
    @order_item = current_order.order_items.new    
  end
end
