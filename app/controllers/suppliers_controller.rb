class SuppliersController < ActionController::Base
  def index
    render :layout => 'application'
  end

  def show
    @supplier = Supplier.find(params[:id])
    render :layout => 'application'
  end

  def new
    @supplier = Supplier.new
    render :layout => 'application'
  end

  def create
    @supplier = Supplier.new(params[:supplier])
    @supplier.business = true
    @supplier.save
    redirect_to @supplier
  end
end
