class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def find_supplier
    supplier_id = params[:supplier_id] || params[:id]
    @supplier = Supplier.find(supplier_id) if Supplier.exists?(supplier_id)
  end
end
