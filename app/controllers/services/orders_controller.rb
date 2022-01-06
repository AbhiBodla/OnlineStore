class Services::OrdersController < OrdersController
    before_action :set_ordered
    
    
    private
    
    def set_ordered
    @ordered = Service.find(params[:service_id])
    
    end
    
    
    
    
    end  