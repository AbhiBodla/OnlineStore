class  CheckoutController < ApplicationController
     skip_forgery_protection
  @data
    def create    
        $data = params          
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                name: params[:name],
                amount: params[:amount].to_i*100,
                quantity: params[:qty].to_i ,
                currency: "inr",                
            }],
            mode: 'payment',
            success_url: checkout_order_place_url,
            cancel_url: root_url,
          })

          respond_to do |format|
           format.js
          end
         
          def order_place
             @order = {"user_id": current_user.id,"orderable_id": $data["id"],"qty": $data["qty"],"orderable_type": $data["orderable_type"],"start_time": $data["start_time"],"end_time": $data["end_time"],"date": $data['date'],"total_amount": $data["total_amount"]}
             @order_place = Order.new(@order)
            respond_to do |format|
                if  @order_place.save
                  format.html { redirect_to @order_place, notice: "Order was successfully created." }
                  format.json { render :show, status: :created, location: @order_place }
                else
                    format.html { render :new, status: :unprocessable_entity }
                    format.json { render json: @order.errors, status: :unprocessable_entity }
                end
            end                 
          end
    end
end