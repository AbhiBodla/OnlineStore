module OrdersHelper


    # if product is already in cart
  def present_in_cart
    # for product
    if @order.orderable_type == "ProductVariant"
        product = ProductVariant.find(@order.orderable_id)
           
            already_added = Order.where(orderable_id: @order.orderable_id, user_id: current_user.id, cart: true, orderable_type: @order.orderable_type)
             
             if(already_added.length != 0)
                already_added.update(qty: @order.qty + already_added[0].qty)
                redirect_to carts_index_path, notice: I18n.t('added_in_cart')
                return true;
             else
                return false;
             end       
     # for service        
    else
        already_added = Order.where(orderable_id: @order.orderable, user_id: current_user.id, cart: true, orderable_type: @order.orderable_type)

             if(already_added.length != 0)
                redirect_to carts_index_path, notice: I18n.t('already_in_cart')
                return true;
             else
                return false;
             end   
    end
  end
end
