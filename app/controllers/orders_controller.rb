class OrdersController < ApplicationController
  before_filter :find_order, :only => [:edit, :update]
  helper_method :sort_column, :sort_direction

  def index
    @orders = @supplier.orders.order([sort_column, sort_direction] * ' ')
    @order = Order.new
    render :layout => 'orders_index'
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
    sort = params[:sort]
    Order.column_names.include?(sort) ? sort : :created_at
  end

  def sort_direction
    direction = params[:direction]
    %w[asc desc].include?(direction) ? direction : :desc
  end
end
