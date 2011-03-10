class SuppliersController < ApplicationController
  before_filter :find_orders, :only => [:orders_update]
  # def index

  def new
    @supplier = Supplier.new(:kind => params[:kind])
  end

  def create
    @supplier = Supplier.new(params[:supplier])
    if @supplier.save
      redirect_to supplier_orders_path(@supplier)
    else
      render :action => :new
    end
  end

  # def edit

  def update
    if @supplier.update_attributes(params[:supplier])
      redirect_to supplier_orders_path(@supplier)
    else
      render :action => :edit
    end
  end

  def orders_update
    case params[:order_action]
      when 'create': order_create
      when 'remark': orders_remark
      when 'order': orders_order
      when 'cancel': orders_cancel
      when 'copy': orders_copy
      when 'delete': orders_destroy
    end
    redirect_to supplier_orders_path(@supplier)
  end

  private
  def find_orders
    @orders = Order.find(params[:order_ids])
  end

  def order_create
    @supplier.orders.build(params[:order]).save
  end

  def orders_remark
    @orders.each do |order|
      order.remark(params[:submit])
    end
  end

  def orders_order
    @orders.each do |order|
      order.order(params[:submit])
    end
  end

  def orders_cancel
    @orders.each do |order|
      order.cancel([params[:submit], order.remarks].compact.join(', '))
    end
  end

  def orders_copy
    @orders.collect(&:clone).each(&:copy)
  end

  def orders_destroy
    Order.destroy(params[:order_ids])
  end
end
