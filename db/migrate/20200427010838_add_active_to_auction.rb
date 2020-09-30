class AddActiveToAuction < ActiveRecord::Migration[6.0]
  def change
    add_column :auctions, :active, :integer, default: 1 #1 is true
  end
end
