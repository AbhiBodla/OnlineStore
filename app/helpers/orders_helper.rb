module OrdersHelper


    # if product is already in cart
  def present_in_cart
    # for product
    if @order.ordered_type == "ProductVariant"
        product = ProductVariant.find(@order.ordered_id)
           
            already_added = Order.where(ordered_id: @order.ordered_id, user_id: current_user.id, cart: true, ordered_type: @order.ordered_type)
             
             if(already_added.length != 0)
                already_added.update(qty: @order.qty + already_added[0].qty)
                redirect_to carts_index_path, notice: I18n.t('added_in_cart')
                return true;
             else
                return false;
             end       
     # for service        
    else
        already_added = Order.where(ordered_id: @order.ordered, user_id: current_user.id, cart: true, ordered_type: @order.ordered_type)

             if(already_added.length != 0)
                redirect_to carts_index_path, notice: I18n.t('already_in_cart')
                return true;
             else
                return false;
             end   
    end
  end
end
