class ApplicationController < ActionController::Base
  include Pundit
    
  include Pagy::Backend
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password,:role) }

      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password,:role) }

    end
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def after_sign_in_path_for(resource)
     
      if session[:addtocart]['orderable_type'] != nil 
    
         if (session[:addtocart]['orderable_type'] == "ProductVariant")          
           ProductVariant.find(session[:addtocart]['orderable_id'])
         else
           ProductService.find(session[:addtocart]['orderable_id'])  
         end          
      else
        root_path
      end  
    end

        private
        
        def user_not_authorized
            flash[:alert] =" You are not authorized to perform this action."
            
            redirect_to((request.referrer || root_path))
        end
end
