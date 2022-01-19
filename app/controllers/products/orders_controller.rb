class Products::OrdersController < OrdersController
    before_action :set_orderable
    
    
    private
    
    def set_orderable
    @orderable = Product.find(params[:product_id])
    
    end
    
    
    
    
    end  