class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @filterrific = initialize_filterrific(
      @category.products.joins(:category).order(created_at: :desc),
      params[:filterrific]
    ) or return
    @products = @filterrific.find.page(params[:page]).per_page(10) 
    @order_item = current_order.order_items.new  
    respond_to do |format|
      format.html
      format.js
    end   
  end
end
