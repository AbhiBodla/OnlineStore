class ProductVariants::OrdersController < OrdersController
    before_action :set_orderable
    
    
    private
    
    def set_orderable
        @orderable = ProductVariant.find(params[:product_variant_id])
    end
    
    
    
    
    end  