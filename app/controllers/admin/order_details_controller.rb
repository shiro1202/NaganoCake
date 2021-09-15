class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    if @order_detail.production_status == "producing"
      @order.update(status: "production")
    end
    if @order.order_details.all? { |order_detail| order_detail.production_status == "finished" }
      @order_detail.order.update(status: "ready_to_ship")
    end
    redirect_to admin_order_path(@order)
  end

  private
    def order_detail_params
      params.require(:order_detail).permit(:production_status)
    end
end
