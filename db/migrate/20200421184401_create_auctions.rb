class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|
      t.string :name
      t.text :description
      t.float :current_price
      t.string :seller
      t.string :highest_bidder 
      t.datetime :auction_end_time
      t.datetime :auction_start_time
      t.float :highest_bid
      t.string :category

      t.timestamps
    end
  end
end
