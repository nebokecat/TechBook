class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller? 
  
    def after_sign_in_path_for(resource)
        user_path(resource.name)
    end

    private
    
        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
        end
   
        def sign_in_required
            redirect_to new_user_session_url unless user_signed_in?
        end
end
