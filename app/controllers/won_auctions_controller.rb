class WonAuctionsController < ApplicationController
    before_action :authenticate_user!
    helper_method :sort_column, :sort_direction
    def index

        won = Auction.where(highest_bidder: current_user.email, active:0)
        won = won.order(sort_column + " " + sort_direction)
        respond_to do |format|
            format.html do
                render :index, locals: { won: won }
            end
        end
    end
end


private
def sort_column
    Auction.column_names.include?(params[:sort]) ? params[:sort] : "name"
end
def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
end






#Line 4: test newly created auction
#won = Auction.where(active:1)

#What goes on line 4
# Line 4 Auction.where(highest_bidder: current_user.email, active:0)