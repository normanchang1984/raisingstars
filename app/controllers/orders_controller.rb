class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    @order = current_user.orders.build
  end

  def create
    @product = Product.find(params[:product_id])

    # @order = current_user.build_order(@product, order_params)
    @order = current_user.orders.build(order_params)
    @order.amount = @product.price
    @order.email = current_user.email
    @order.product_id = @product.id
    @order.proposal_id = @product.proposal.id

    if @order.save
      cookies[:cart_id] = nil
      if @order.payment_method == "allpay"

        redirect_to checkout_allpay_proposal_product_order_path(params[:proposal_id],params[:product_id],@order)
      else
        redirect_to products_path
      end

    else
      render :new
    end
  end

  def checkout_allpay
    @order = current_user.orders.find( params[:id] )
    @payment = PaymentAllpay.create!( :order => @order,
                                      :payment_method => "Credit" )
    render :layout => false
  end

  protected

  def order_params
    params.require(:order).permit(:name, :email, :phone, :address, :amount, :payment_method)
  end
end
