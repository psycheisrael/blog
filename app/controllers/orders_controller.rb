class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit

  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
     if @order.save
       flash.notice = "The order record was created successfully."
       redirect_to @order
     else
       flash.now.alert = @order.errors.full_messages.to_sentence
       render :new
     end
    end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    if @order.update(order_params)
      flash.notice = "The order record was updated successfully."
      redirect_to @order
    else
      flash.now.alert = @order.errors.full_messages.to_sentence
      render :edit
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_path, notice: 'Order was successfully destroyed.'and return }
      format.json { head :no_content }
    end
  end
  private
    # Only allow a list of trusted parameters through.
      def order_params
        params.require(:order).permit(:product_name, :product_count, :customer_id)
      end
     def set_order
        @order = Order.find(params[:id])
     end
     def catch_not_found(e)
       Rails.logger.debug("We had a not found exception.")
       flash.alert = e.to_s
      redirect_to order_path
     end
   end
