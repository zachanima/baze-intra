class SuppliersController < ApplicationController
  def show
    @supplier = Supplier.find(params[:id])
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
end
