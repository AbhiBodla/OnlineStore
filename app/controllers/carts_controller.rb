class CartsController < ApplicationController



  def index    
     @cart = Order.all 
  end
  
  def edit
  end

  def show
  end

  def pay_now
     respond_to do |format|
      if Order.where(:user_id => current_user.id, :cart => "true" ).update_all("cart = false")
        format.html { redirect_to orders_path, notice: "Cart was successfully updated." }
        format.json { render :orders_path, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_qty
    order = Order.find(params[:order_id].to_i)
    order.update(qty: params[:qty].to_i, total_amount: params[:new].to_i)
  end

  def update_time
    order = Order.find(params[:order_id].to_i)
    order.update(tim: params[:time].to_i, total_amount: params[:new].to_i)
  end


  def create  
  end
end
