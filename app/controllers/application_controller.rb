class ApplicationController < ActionController::Base
    
    before_action :configure_permitted_parameters,
    if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update) { |u| 
            u.permit(:avatar, :email, :password, :password_confirmation, :current_password)
        }
    end
    
    before_action :Auction.where('auction_end_time < ?',Time.new.utc ).update_all(active: 0)
    before_action :Auction.where('auction_end_time > ?',Time.new.utc ).update_all(active: 1)
    
end
