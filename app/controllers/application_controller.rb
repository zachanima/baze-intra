class ApplicationController < ActionController::Base
  before_filter :find_supplier
  protect_from_forgery

  private
  def find_supplier
    supplier_id = params[:supplier_id] || params[:id]
    @supplier = Supplier.find_by_id(supplier_id)
  end
end
