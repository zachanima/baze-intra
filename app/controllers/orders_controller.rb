class OrdersController < ApplicationController
  before_filter :find_supplier
  before_filter :find_order

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order.update_attributes(params[:order])
    redirect_to @supplier
  end
    
  private
  def find_order
    @order = Order.find(params[:id])
  end
end
