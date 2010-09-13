class SuppliersController < ActionController::Base
  def show
    @supplier = Supplier.find(params[:id])
  end
end
