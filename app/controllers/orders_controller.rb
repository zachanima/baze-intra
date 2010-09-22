class OrdersController < ApplicationController
  before_filter :find_supplier
  before_filter :find_order, :only => [:edit, :update]
  helper_method :sort_column, :sort_direction

  def index
    respond_to do |format|
      @orders = @supplier.orders.order([sort_column, sort_direction] * ' ')
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

  def sort_column
    Order.column_names.include?(params[:sort]) ? params[:sort] : :created_at
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : :desc
  end
end
