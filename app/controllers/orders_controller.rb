class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  # def show
  # end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to orders_path
    else 
      render :edit
    end
  end

  def destroy
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:description, :status)
  end
end
