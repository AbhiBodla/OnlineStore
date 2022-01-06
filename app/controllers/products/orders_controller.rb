class Products::OrdersController < OrdersController
    before_action :set_ordered
    
    
    private
    
    def set_ordered
    @ordered = Product.find(params[:product_id])
    
    end
    
    
    
    
    end  