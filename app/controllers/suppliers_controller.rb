class SuppliersController < ApplicationController
  before_filter :find_supplier, :only => [:show, :edit, :update, :orders_update]

  # def index

  def show
    @order = Order.new
    @orders = @supplier.orders.order("created_at desc")
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(params[:supplier])
    if @supplier.save
      redirect_to @supplier
    else
      render :action => :new
    end
  end

  # def edit

  def update
    if @supplier.update_attributes(params[:supplier])
      redirect_to @supplier
    else
      render :action => :edit
    end
  end

  def orders_update
    if params[:create]
      order_create
    elsif params[:order_ids]
      @orders = Order.find(params[:order_ids])
      if params[:delete]
        orders_destroy
      elsif params[:copy]
        orders_copy
      elsif params[:complete]
        orders_complete
      end
    end
    redirect_to @supplier
  end

  private
  def find_supplier
    @supplier = Supplier.find(params[:id])
  end

  def order_create
    @supplier.orders.build(params[:order]).save
  end

  def orders_destroy
  end

  def orders_copy
  end

  def orders_complete
  end
end
