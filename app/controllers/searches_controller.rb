class SearchesController < ApplicationController

  def search 
    if params[:search].blank?
      @results = Auction.all
    else
      @results = Auction.joins(:seller).search(params[:search])
    end
  end

end
