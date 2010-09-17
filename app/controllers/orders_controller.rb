class OrdersController < ApplicationController
  before_filter :find_supplier
  before_filter :find_order, :only => [:edit, :update]

  def index
    @orders = @supplier.orders.where('id > ?', params[:id]).order('created_at desc')
  end

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
