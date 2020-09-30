# == Schema Information
#
# Table name: bids
#
#  id         :bigint           not null, primary key
#  bid_price  :float
#  user       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_bids_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Bid < ApplicationRecord


    #<-- Association to User -->
    belongs_to(
    :user,
    foreign_key: 'user_id',
    #optional: true
    )


end
