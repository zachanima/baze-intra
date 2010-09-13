class SuppliersController < ApplicationController
  def index
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(params[:supplier])
    @supplier.business = true
    @supplier.save
    redirect_to @supplier
  end
end
