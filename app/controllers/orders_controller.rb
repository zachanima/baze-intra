class OrdersController < ApplicationController
  before_filter :find_supplier

  def edit
    @order = Order.find(params[:id])
  end
end
