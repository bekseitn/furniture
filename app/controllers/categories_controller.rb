class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc).page(params[:page])
    @order_item = current_order.order_items.new    
  end
end
