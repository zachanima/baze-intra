class ApplicationController < ActionController::Base
  before_filter :find_supplier
  protect_from_forgery

  private
  def find_supplier
    @supplier = Supplier.find_by_id(params[:supplier_id] || params[:id])
  end
end
