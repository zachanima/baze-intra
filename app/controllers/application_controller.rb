class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def find_supplier
    @supplier = Supplier.find(params[:supplier_id] || params[:id])
  end
end
