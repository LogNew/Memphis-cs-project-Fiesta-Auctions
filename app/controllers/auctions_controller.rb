class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  helper_method :sort_column, :sort_direction
  

  

  # GET /auctions
  # GET /auctions.json
  def index
    Auction.where('auction_end_time < ?',Time.new.utc ).update_all(active: 0)
    Auction.where('auction_end_time > ?',Time.new.utc ).update_all(active: 1)
    auction = Auction.where(active:1)
    @auctions = auction.order(sort_column + " "+ sort_direction)
  end


  def new
    @auction = Auction.new
  end

  def create
    @auction = current_user.auctions.new(params.require(:auction).permit(:name, :description, :current_price, :seller, :highest_bidder, :auction_end_time, :auction_start_time, :highest_bid, :category, :image, :active))

    respond_to do |format|
      if @auction.save
        format.html { redirect_to @auction, notice: 'Auction was successfully created.' }
        format.json { render :show, status: :created, location: @auction }
      else
        format.html { render :new }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    # load existing object again from URL param
    auction = Auction.find(params[:id])
    # respond_to block
    respond_to do |format|
      format.html do 
      # if question updates with permitted params
        if auction.update(params.require(:auction).permit(:name, :current_price, :description, :auction_start_time, :auction_end_time, :category, :image))
          flash[:success] = 'Auction updated successfully'
          redirect_to my_auctions_url
        else
          flash.now[:error] = 'Error: Auction could not be updated'
          render :edit, locals: {auction: auction}
        end
      end
    end
  end





  def edit
    auction = Auction.find(params[:id])
        respond_to do |format|
            format.html { render :edit,
                         locals: { auction: auction } }
        end

  end






  def show
    auction = Auction.find(params[:id])
    respond_to do |format|
      format.html {render :show,
                    locals:{ auction: auction} }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end
    def sort_column
      Auction.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
