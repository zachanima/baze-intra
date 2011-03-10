class SuppliersController < ApplicationController
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
    if params[:create]
      order_create
    elsif params[:remark]
      orders_remark
    else
      case params[:order_action]
        when 'order': orders_ordered_by
        when 'cancel': orders_cancel
        when 'copy': orders_copy
        when 'delete': orders_destroy
      end
    end
    redirect_to supplier_orders_path(@supplier)
  end

  private
  def order_create
    @supplier.orders.build(params[:order]).save
  end

  def orders_ordered_by
    Order.find(params[:order_ids]).each do |order|
      order.order(params[:submit])
    end
  end

  def orders_cancel
    Order.find(params[:order_ids]).each do |order|
      order.cancel([params[:submit], order.remarks].compact.join(', '))
    end
  end

  def orders_copy
    Order.find(params[:order_ids]).collect(&:clone).each do |clone|
      clone.created_at = nil
      clone.save
    end
  end

  def orders_destroy
    Order.destroy(params[:order_ids])
  end

  def orders_remark
    Order.find(params[:order_ids]).each do |order|
      order.remarks = params[:remark]
      order.save
    end
  end
end
