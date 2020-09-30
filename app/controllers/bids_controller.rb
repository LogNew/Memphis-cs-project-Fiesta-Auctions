class BidsController < ApplicationController
    before_action :authenticate_user!

    def new 
       bid = Bid.new
       respond_to do |format|
        format.html { render :new, locals: {bid: bid} }
      end
    end


    def create
        # new object from params
        bid = Bid.new(params.require(:bid).permit(:bid_price))
        bid.user = current_user
        # respond_to block
        respond_to do |format|
            format.html do
                if bid.save
                    flash[:success] = "Your Bid was successful"
                    redirect_to user_url
                else
                    flash.now[:error] = "Error: Bid could not be added"
                    render :new, locals: { bid: bid }
                end
            end
        end
    end





end
