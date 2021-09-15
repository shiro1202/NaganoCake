class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "confirmation"
      @order.order_details.each do |detail|
        detail.update(production_status: "waiting_for_production")
      end
    end
    redirect_to admin_order_path(@order)
  end

  private
    def order_params
      params.require(:order).permit(:status)
    end

end
