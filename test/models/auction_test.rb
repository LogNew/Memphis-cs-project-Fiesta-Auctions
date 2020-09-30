# == Schema Information
#
# Table name: auctions
#
#  id                 :bigint           not null, primary key
#  active             :integer          default(1)
#  auction_end_time   :datetime
#  auction_start_time :datetime
#  category           :string
#  current_price      :float
#  description        :text
#  highest_bid        :float
#  highest_bidder     :string
#  name               :string
#  seller             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint
#
# Indexes
#
#  index_auctions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class AuctionTest < ActiveSupport::TestCase
   test "fixtures are valid" do
     a = auctions(:one)
     assert a.valid?, a.errors.full_messages.inspect
   end

  
end
