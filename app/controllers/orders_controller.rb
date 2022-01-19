class OrdersController < ApplicationController
  include  OrdersHelper
  skip_forgery_protection
  before_action :set_order, only: %i[ show edit update destroy ]
 

  # GET /orders or /orders.json
  def index
    @orders = Order.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Orders: #{@orders.count}", template: "orders/index.html.erb", layout: "pdf"   # Excluding ".pdf" extension.
      end
    end
  end

  # GET /orders/1 or /orders/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Order id: #{@order.id}", template: "orders/orders.html.erb"   # Excluding ".pdf" extension.
      end
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  def time_slot
    
    respond_to do |format|
      format.js {render layout: false}
      format.html
    end
  end

  # POST /orders or /orders.json
  def create
    @order = @orderable.orders.new (order_params)
     
    @order.user_id = current_user.id
        if params[:addtocart] == "Add to Cart"
          if present_in_cart()    == false      
                    @order.cart=1
                  respond_to do |format|
                    if @order.save                     
                      format.html { redirect_to carts_index_path, notice: I18n.t('order_created') }
                      format.json { render :show, status: :created, location: @order }
                    end
                  end
                end                                        
          else
                  @order.cart=0
                  respond_to do |format|
                    if @order.save
                      format.html { redirect_to @order, notice:I18n.t('order_created') }
                      format.json { render :show, status: :created, location: @order }
                    end         
                  end
          end        
end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: I18n.t('order_updated') }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: I18n.t('order_destroyed') }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:orderable_id, :orderable_type, :total_amount, :tim, :date, :qty, :user_id, :start_time, :end_time, :duration )
    end

   
end
