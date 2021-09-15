class Public::OrdersController < ApplicationController
  before_action :check_cart, except: [:complete]

  def new
    @order = Order.new
    @addresses = current_end_user.addresses
  end

  def comfirm
    @cart_items = CartItem.where(end_user_id: current_end_user.id)
    @order = Order.new(order_params)
    @order.order_details.build

    if params[:order][:address_option] == "0"
      @order.postal_code = current_end_user.postal_code
      @order.address = current_end_user.address
      @order.name = current_end_user.last_name+current_end_user.first_name

    elsif  params[:order][:address_option] ==  "1"
      @order.postal_code = Address.find(params[:order][:add]).postal_code
      @order.address = Address.find(params[:order][:add]).address
      @order.name = Address.find(params[:order][:add]).name

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
    @order.end_user_id = current_end_user.id
    @order.save
    cart_item = CartItem.where(end_user_id: current_end_user.id)
    cart_item.destroy_all
    redirect_to orders_complete_path
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:end_user_id, :shipping_cost, :total_payment, :name, :postal_code, :address, :payment_method, :status,
    order_details_attributes:[:id, :amount, :tax_included_price, :item_id, :order_id])
  end

  def check_cart
    @cart_items = CartItem.where(end_user_id: current_end_user.id)
    if @cart_items.blank?
      redirect_to cart_items_path
    end
  end

end
