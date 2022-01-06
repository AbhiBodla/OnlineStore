class ProductVariants::OrdersController < OrdersController
    before_action :set_ordered
    
    
    private
    
    def set_ordered
        @ordered = ProductVariant.find(params[:product_variant_id])
    end
    
    
    
    
    end  