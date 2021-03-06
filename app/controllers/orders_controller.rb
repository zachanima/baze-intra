# Control indexing of orders, and individual orders.
class OrdersController < ApplicationController
  before_filter :find_order, :only => [:edit, :update]
  before_filter :find_supplier
  helper_method :sort_column, :sort_direction

  def index
    @orders = @supplier.orders.order([sort_column, sort_direction] * ' ')
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order.update_attributes(params[:order])
    redirect_to supplier_orders_path(@supplier)
  end


  private
  def find_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end

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
