class OrdersController < ApplicationController
  before_filter :find_supplier
  before_filter :find_order, :only => [:edit, :update]

  def index
    respond_to do |format|
      @orders = @supplier.orders.order("created_at desc")
      format.html { @order = Order.new; render :layout => 'orders_index' }
      format.js   { @orders = @orders.where('id > ?', params[:id]) }
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order.update_attributes(params[:order])
    redirect_to supplier_orders_path(@supplier)
  end
    
  private
  def find_order
    @order = Order.find(params[:id])
  end
end
