class ProductServices::OrdersController < OrdersController
    before_action :set_orderable
    
    
    private
    
    def set_orderable
    @orderable = ProductService.find(params[:product_service_id])
    
    end
    
    
    
    
    end  