class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.string :user
      t.float :bid_price

      t.timestamps
    end
  end
end
