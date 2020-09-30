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
class Auction < ApplicationRecord
    has_one_attached :image

# association to seller
  
    belongs_to(
        :seller,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :auctions
    )

    has_one_attached :image
    belongs_to :user
    validates :active, inclusion: { in: [0,1] }
    validates :current_price, numericality: true
    
    def self.search(search)  
      where("lower(users.name) LIKE :search OR 
             lower(auctions.category) LIKE :search OR
             lower(auctions.name) LIKE :search", search: "%#{search.downcase}%").uniq   
   end


end
