class MyAuctionsController < ApplicationController
    before_action :authenticate_user!
    Auction.where('auction_end_time < ?',Time.new.utc ).update_all(active: 0)
    Auction.where('auction_end_time > ?',Time.new.utc ).update_all(active: 1)

    def index
        
        auctions = current_user.auctions
        respond_to do |format|
            format.html do
                render :index, locals: { auctions: auctions }
            end
        end
    end




    def past
     #   past = current_user.auctions



        date = Time.now
        date
     past = current_user.auctions.where('auction_end_time <= ?', Time.now)
        



      #  past = current_user.auctions.all(:conditions =>["created_at > ? AND created_at < ?", params[:start_date], params[:end_date]])
            respond_to do |format|
                format.html do
                    render :past_auctions, locals: { auctions: past, date: date }
                end
            end
    end



end
