class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_end_user.addresses
  end

  def comfirm
    @cart_items = CartItem.where(end_user_id: current_end_user.id)
    params[:order][:payment_method] = params[:order][:payment_method].to_i
    @order = Order.new(order_params)

    if params[:order][:address_option] == "0"
      @order.postal_code = current_end_user.postal_code
      @order.address = current_end_user.address
      @order.name = current_end_user.last_name+current_end_user.first_name

    elsif  params[:order][:address_option] ==  "1"
      @order.postal_code = Address.find(params[:order][:address]).postal_code
      @order.address = Address.find(params[:order][:address]).address
      @order.name = Address.find(params[:order][:address]).name

    elsif params[:order][:address_option] ==  "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:end_user_id, :shipping_cost, :total_payment, :name, :postal_code, :address, :payment_method, :status )
  end


end
