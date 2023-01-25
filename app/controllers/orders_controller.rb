class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update]
  before_action :verify_status, only: [:update]

  def index
    @orders = Order.where(filter_query).reverse_order
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

  # def destroy
  # end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:description, :status)
  end

  def filter_params
    params.permit(:id, statuses: [])
  end

  def filter_query
    query = {}

    query[:id] = params[:id] if params[:id].present?
    query[:status] = params[:statuses] if params[:statuses].present?

    return query
  end

  def verify_status
    params[:order].extract!(:status) if !Order.can_update_status(@order.status, order_params[:status])
  end
end
