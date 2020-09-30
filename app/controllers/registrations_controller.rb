class RegistrationsController < Devise::RegistrationsController

    def sign_up_params
        params.require(:user).permit(:name, :location, :email, :password)
    end
end