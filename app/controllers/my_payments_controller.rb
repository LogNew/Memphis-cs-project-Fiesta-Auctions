class MyPaymentsController < ApplicationController
    before_action :authenticate_user!
    def index
        my_payments = current_user.my_payments
        respond_to do |format|
            format.html { render :index, locals: { my_payments: my_payments } }
        end
    end

    def new
        my_payments = MyPayments.new
        respond_to do |format|
            format.html { render :new, locals: { my_payments: my_payments } }
        end
    end

    def create
        my_payment = current_user.my_payments.build(params.require(:my_payments).permit(:name, :card_number, :exp_date, :security_number))
        respond_to do |format|
            format.html do
                if my_payment.save
                    flash[:success] = "Card registered successfully!"
                    redirect_to my_payments_url 
                else
                    flash.now[:error] = "Error. Card could not be saved."
                    render :new, locals: { my_payment: my_payment }
                end
            end
        end
    end

end

